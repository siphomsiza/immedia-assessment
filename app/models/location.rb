# == Schema Information
#
# Table name: locations
#
#  id          :uuid             not null, primary key
#  title       :string
#  description :text
#  image_url   :text
#  user_id     :uuid             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Location < ActiveRecord::Base
  include LocationAdmin
  has_paper_trail

  belongs_to :user,
  class_name: "User",
  foreign_key: :user_id

  validates :image_url,
  uniqueness: true

  validates :title,:description,:image_url,:user,presence: true

end
