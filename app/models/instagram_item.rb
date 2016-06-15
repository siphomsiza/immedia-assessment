# == Schema Information
#
# Table name: instagram_items
#
#  id                             :uuid             not null, primary key
#  instagram_id                   :string           not null
#  created_time                   :datetime         not null
#  username                       :string           not null
#  user_id                        :uuid             not null
#  link                           :string           not null
#  path                           :string           not null
#  latitude                       :float            not null
#  longitude                      :float            not null
#  distance_from_center_in_meters :float            not null
#  instagram_type                 :string           not null
#  filter                         :string
#  full_data                      :text             not null
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#
# Indexes
#
#  index_instagram_items_on_created_time            (created_time)
#  index_instagram_items_on_instagram_id            (instagram_id) UNIQUE
#  index_instagram_items_on_latitude_and_longitude  (latitude,longitude)
#  index_instagram_items_on_path                    (path)
#  index_on_distance_and_created                    (distance_from_center_in_meters,created_time)
#
# Foreign Keys
#
#  fk_rails_bb6842470b  (user_id => users.id)
#

class InstagramItem < ActiveRecord::Base
  LATITUDE = ENV['LATITUDE'].to_f
  LONGITUDE = ENV['LONGITUDE'].to_f
  CENTER_COORDINATES = [LATITUDE, LONGITUDE]
  INSTAGRAM_MAX_ALLOWED_DISTANCE = 5_000
  MAX_DISTANCE_IN_METERS = [ENV['MAX_DISTANCE_IN_METERS'].to_f, INSTAGRAM_MAX_ALLOWED_DISTANCE].min.to_f
  METERS_PER_MILE = 5280 * 12 * 2.54 / 100

  CONFIG_REQUIRED_VARS = %w(LATITUDE LONGITUDE MAX_DISTANCE_IN_METERS INSTAGRAM_CLIENT_ID)
  CONFIG_EXITS = CONFIG_REQUIRED_VARS.select { |k| ENV[k].blank? }

  validates_uniqueness_of :instagram_id
  validates_presence_of :instagram_id, :created_time, :full_data,
                        :latitude, :longitude, :distance_from_center_in_meters,
                        :username, :user_id, :link, :path, :instagram_type

  def self.instagram_items(opts = {})
    max_timestamp = opts.fetch(:max_timestamp, Time.zone.now)
    number_of_pages = opts.fetch(:max_number_of_pages, 10)
    stop_time = opts[:stop_at_timestamp].to_i

    number_of_pages.times do
      return if stop_time > 0 && stop_time > max_timestamp.to_i
      puts [max_timestamp, Time.zone.at(max_timestamp)].join("\t")
      items = fetch_items_and_save(opts)
      max_timestamp = items.last.created_time.to_i
    end
  end

  def self.fetch_items_and_save(opts = {})
    fetch_items(opts).each do |media|
      create do |item|
        item.full_data = media
        item.instagram_id = media.id
        item.created_time = Time.zone.at(media.created_time.to_i)
        item.username = media.user.username
        item.user_id = media.user.id
        item.link = media.link
        item.latitude = media.location.latitude
        item.longitude = media.location.longitude
        item.instagram_type = media.type
        item.filter = media.filter
      end
    end
  end

  def self.fetch_items(opts = {})
    opts.reverse_merge!(distance: MAX_DISTANCE_IN_METERS)
    latitude = opts[:latitude].present? ? opts[:latitude] : LATITUDE
    longitude = opts[:longitude].present? ? opts[:longitude] : LONGITUDE
    Instagram.client.media_search(latitude, longitude, opts)
  end

end
