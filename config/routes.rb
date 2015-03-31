Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  root :to => "users#index"
  resources :users
  resources :questions
end
