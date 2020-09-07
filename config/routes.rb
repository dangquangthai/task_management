Rails.application.routes.draw do
  devise_for :users
  root 'tasks#index'
  resources :claims
end
