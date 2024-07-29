Rails.application.routes.draw do
  root "quality_projects#index"

  devise_for :users

  resources :parts
  resources :quality_projects
end
