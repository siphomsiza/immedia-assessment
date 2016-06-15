# == Schema Information
#
# Table name: user_profiles
#
#  id         :uuid             not null, primary key
#  user_id    :uuid             not null
#  data       :jsonb
#  picture    :text
#  firstname  :string
#  lastname   :string
#  birthdate  :date
#  gender     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_user_profiles_on_data     (data)
#  index_user_profiles_on_user_id  (user_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_87a6352e58  (user_id => users.id)
#

class UserProfile < ActiveRecord::Base
  include UserProfileAdmin
  has_paper_trail

  mount_uploader :picture, ProfilePictureUploader

  attr_accessor :is_nested, :profile_is_nested

  belongs_to :user,
  class_name: "User",
  foreign_key: :user_id

  validates :user_id,
  uniqueness: true,
  allow_nil: true

  validates :firstname,:lastname,:gender,
  presence: true


  def name
    [firstname, lastname].compact.join(" ")
  end

  def profile_is_nested=(v)
    @is_nested = v
  end

  def profile_is_nested
    @is_nested
  end

  private

end
