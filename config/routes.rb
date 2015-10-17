Rails.application.routes.draw do
  resources :jobs
  resources :posts

  root to: 'home#index'
end
