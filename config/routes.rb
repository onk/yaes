Yaes::Application.routes.draw do
  devise_for :admin_users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  root to: "users#home"
end

