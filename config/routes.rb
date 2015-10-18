Rails.application.routes.draw do
  devise_for :admins
  resources :jobs do
    resources :applications, except: :index
  end

  get 'applications' => 'applications#index', as: :applications
  
  devise_scope :admin do
    get "/admin" => "devise/sessions#new"
  end

  root to: 'home#index'
end
