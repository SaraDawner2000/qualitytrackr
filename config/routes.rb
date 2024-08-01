Rails.application.routes.draw do
  devise_for :users

  resources :parts
  resources :quality_projects

  get "/" => "dashboards#show", as: :dashboard
end
