Rails.application.routes.draw do
  root to: "employees#index"
  resources :employees do
    member do
      get :history
      get :report
    end
  end
  resources :statuses
  resources :locations
  resources :time_works
end
