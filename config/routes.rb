Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :body_mass_indices, only: [ :index, :create ]
end
