Rails.application.routes.draw do
  devise_for :users
  resources :items do
    resources :records
  end
  root to: "items#index"

end