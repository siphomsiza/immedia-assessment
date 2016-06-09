module UserProfileAdmin
  extend ActiveSupport::Concern

  def self.included(klazz)
    klazz.rails_admin do
      visible false

      weight 3
      navigation_label "User Management"

      configure :gender, :enum do
        enum do
          Settings.USER_PROFILE_GENDERS
        end
      end

      configure :is_nested, :hidden do
        default_value do
          true
        end
      end

      list do
        field :id
        field :user
        field :picture, :carrierwave
        field :created_at
      end

      edit do
        field :user
        field :picture, :carrierwave
        field :firstname
        field :lastname
        field :birthdate, :date
        field :gender, :enum
      end

      nested do

        field :is_nested, :hidden do
          default_value do
            true
          end
        end

        field :picture, :carrierwave
        field :firstname
        field :lastname
        field :birthdate, :date
        field :gender, :enum
        exclude_fields :user
      end

      show do
        field :id
        field :user
        field :picture, :carrierwave
        field :firstname
        field :lastname
        field :birthdate, :date
        field :gender
        field :created_at
        field :updated_at
      end
    end
  end
end
