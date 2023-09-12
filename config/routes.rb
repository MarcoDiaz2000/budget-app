Rails.application.routes.draw do
  devise_for :users
  
  root 'home#index'
  
  resources :groups do
    resources :entities
  end
end
