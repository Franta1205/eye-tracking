Rails.application.routes.draw do
  devise_for :users

  root "analyses#index"
  
  resources :analyses, only: [:new, :create, :show]
  
end
