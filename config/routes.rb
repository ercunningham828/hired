Rails.application.routes.draw do
  resources :jobs do
    resources :applications, except: :index
  end

  get 'applications' => 'applications#index', as: :applications

  root to: 'home#index'
end
