Rails.application.routes.draw do
  devise_for :users

  root "landing_page#home"

  resources :parts do
    member do
      get :remove_drawing
    end
  end
  resources :quality_projects do
    member do
      get :remove_inspection_plan
      get :remove_assembled_record
    end
  end

  get "/dashboard" => "dashboards#show", as: :dashboard
  get "dashboard/sort_parts", to: "dashboard#sort_parts", as: :sort_parts_dashboard
  get "dashboard/sort_quality_projects", to: "dashboard#sort_quality_projects", as: :sort_quality_projects_dashboard
end
