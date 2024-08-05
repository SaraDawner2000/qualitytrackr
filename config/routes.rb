Rails.application.routes.draw do
  devise_for :users

  root "landing_page#home"

  resources :parts do
    member do
      get :remove_drawing
    end
  end
  resources :quality_projects

  get "/dashboard" => "dashboards#show", as: :dashboard
end
