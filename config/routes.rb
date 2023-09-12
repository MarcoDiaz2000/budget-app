Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  
  root 'home#index'
  
  resources :groups do
    resources :entities
  end
end