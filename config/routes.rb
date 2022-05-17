# frozen_string_literal: true

Rails.application.routes.draw do
  resources :wishlists
  resources :infos
  resources :plants
  resources :seed_shares
  resources :plans
  require 'sidekiq/web'

  scope :monitoring do
    # Sidekiq Basic Auth from routes on production environment
    if Rails.env.production?
      Sidekiq::Web.use Rack::Auth::Basic do |username, password|
        ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(username),
                                                    ::Digest::SHA256.hexdigest(Rails.application.credentials.sidekiq[:auth_username])) &
          ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(password),
                                                      ::Digest::SHA256.hexdigest(Rails.application.credentials.sidekiq[:auth_password]))
      end
    end
    mount Sidekiq::Web, at: '/sidekiq'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :users do
        post :login
        delete :logout
        get :me
        post :create
      end
      # localhost:3000/api/v1/plans/my_plans
      namespace :plans do
        get :my_plans
      end
      # localhost:3000/api/v1/plants/my_plants
      namespace :plants do
        get :my_plants
      end
      # localhost:3000/api/v1/seed-shares/my_seed_shares
      namespace :seed_shares do
        get :my_seed_shares
      end
      # localhost:3000/api/v1/wishlists/my_wishlists
      namespace :wishlists do
        get :my_wishlists
      end
      resources :plans
      resources :plants
      resources :seed_shares
      resources :wishlists
    end
  end
end
