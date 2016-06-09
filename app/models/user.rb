# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  email                  :text             default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :text
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  system_admin           :boolean          default(FALSE)
#  active                 :boolean          default(TRUE)
#  receive_newsletter     :boolean          default(FALSE)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#

class User < ActiveRecord::Base
  extend Forwardable
  include  UserAdmin

  default_scope ->{ order("created_at desc").includes(:profile)}

  #Track changes to your models, for auditing or versioning
  has_paper_trail

  # Include default devise modules. Others available are:
  #  and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable,
  :validatable,
  :confirmable,
  :lockable,
  :timeoutable

  has_one :profile,
  class_name: "UserProfile",
  foreign_key: :user_id,
  dependent: :destroy
  accepts_nested_attributes_for :profile, allow_destroy: false,  update_only: true


  # get all the user profile details here
  def_delegators :user_profile,
  :firstname,
  :firstname=,
  :lastname,
  :lastname=,
  :birthdate,
  :birthdate=,
  :gender,
  :gender=,
  :picture,
  :picture=,
  :picture_cache,
  :picture_cache=,
  :remove_picture,
  :remove_picture=,
  :profile_is_nested,
  :profile_is_nested=


  validates :profile,:email,
  presence: true

  after_initialize :do_after_initialize
  before_validation :mark_nested_to_true

  def mark_nested_to_true
    profile_is_nested = true
  end

  def name
    [firstname, lastname].compact.join(" ").presence || email
  end
  alias :fullname :name

  def user_profile
    self.profile || self.build_profile
  end

  def do_after_initialize
    user_profile
    profile_is_nested = true
    return true
  end

end
