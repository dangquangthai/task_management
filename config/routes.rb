Rails.application.routes.draw do
  devise_for :users
  root 'backlogs#index'
  resources :backlogs
end
