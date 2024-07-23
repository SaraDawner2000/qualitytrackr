Rails.application.routes.draw do
  root "parts#index"

  devise_for :users

  resources :parts
  resources :quality_projects
end
