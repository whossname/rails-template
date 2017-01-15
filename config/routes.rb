Rails.application.routes.draw do
  resources :home
  devise_for :users
  get 'home/index'
  root 'home#index'
end

