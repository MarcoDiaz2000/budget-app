Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  
  root 'home#index'
  
  resources :groups, only: [:index, :show, :new, :create] do
    resources :entities, only: [:new, :create]
  end
end