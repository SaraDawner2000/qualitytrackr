Rails.application.routes.draw do
  root "parts#index"
  resources :parts
  devise_for :users
end
