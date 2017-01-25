Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :home 
  devise_for :users
  get 'home/index'
  root 'home#index'
end
