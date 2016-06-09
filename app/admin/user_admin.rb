  module UserAdmin
    extend ActiveSupport::Concern

    def self.included(klazz)
      klazz.rails_admin do
        configure :is_nested, :hidden do
          default_value do
            true
          end
        end

        list do
          field :id
          field :picture, :carrierwave
          field :firstname
          field :lastname
          field :email
        end

        edit do
          field :email
          field :profile
        end

        nested do
          field :is_nested, :hidden do
            default_value do
              true
            end
          end
          field :email
          field :profile
        end

        show do
          field :id
          field :email
          field :profile
          field :created_at
          field :updated_at
        end
      end
    end
  end
