Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  scope '/backend' do
    get "up" => "rails/health#show", as: :rails_health_check

    # Defines the root path route ("/")
    # root "posts#index"
    namespace :api do
      resources :articles
    end
    namespace :admin do
      resources :sessions, only: [:create]
      delete 'sessions', to: 'sessions#destroy', as: 'destroy_admin_session'
      namespace :api do
        resources :articles
        resources :images
      end
    end
  end
end
