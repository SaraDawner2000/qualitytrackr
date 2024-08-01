Rails.application.routes.draw do
  devise_for :users

  root "landing_page#home"

  resources :parts
  resources :quality_projects

  get "/dashboard" => "dashboards#show", as: :dashboard
end
