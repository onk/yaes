Yaes::Application.routes.draw do
  devise_for :admin_users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :topics, only: [:show] do
    collection do
      get :information
    end
  end
  root to: "users#home"
end

