Rails.application.routes.draw do
  get 'foursquare_locations/request_location'
  get 'foursquare_locations/fetch_items_and_save'
  put 'foursquare_locations/fetch_items_and_save'


  get 'system/unsubscribe', as: 'unsubscribe'
  get 'system/about_us', as: 'about_us'
  get 'system/privacy_policy', as: 'privacy_policy'
  get 'system/terms_of_use', as: 'terms_of_use'
  get 'system/contact_us', as: 'contact_us'
  get 'system/faq', as: 'faq'

  class IsJson
    def self.matches?(request)
      request.format.present? && request.format.symbol == :json
    end
  end

  #devise_for :users, class_name: "User", path: "authentication"
  devise_for :users, class_name: "User", :controllers => { omniauth_callbacks: 'omniauth_callbacks'}

  devise_scope :user do
    get "/authentication", to: 'devise/sessions#new'
  end

  namespace :api do
    namespace :v1, defaults: {format: 'json'}, constraints: IsJson do
      namespace :auth do
        devise_for :users,
        class_name: "User",
        :controllers => {
          sessions: 'api/v1/auth/sessions',
          registrations: 'api/v1/auth/registrations',
          passwords: 'api/v1/auth/passwords',
          unlocks: 'api/v1/auth/unlocks',
          confirmations: 'api/v1/auth/confirmations'
        }
      end

      resources :users
      resources :user_devices
    end
  end

  devise_scope :user do
    post "api/v1/auth/users/password/update", to: "api/v1/auth/passwords#update"
    post "api/v1/auth/users/update", to: "api/v1/auth/registrations#update"
  end

  scope "/:section/:subsection/:current_account_id", defaults: {section: 'home', subsection: 'main', current_account_id: '0' } do
    mount RailsAdmin::Engine => '/ra', as: 'rails_admin'
  end

  get "latest_adverts", to: "home#index",  constraints: { format: 'json'}

  authenticated :user do
    get "/", to: "home#index"
    get "/forwarder", to: "home#fowarder", as: :fowarder
  end

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
