  module LocationAdmin
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
          field :title
          field :description
          field :image_url
          field :user
        end

        create do
          field :title
          field :description
          field :image_url
          field :user_id do
            default_value do
              bindings[:view].current_user.id
            end
          end
        end

        edit do
          field :title
          field :description
          field :image_url
        end

        nested do
          field :is_nested, :hidden do
            default_value do
              true
            end
          end
          field :title
          field :description
          field :image_url
          field :user
        end

        show do
          field :id
          field :title
          field :description
          field :image_url
          field :user
          field :created_at
          field :updated_at
        end
      end
    end
  end
