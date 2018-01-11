Rails.application.routes.draw do

  match 'users/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match '/logout', to: 'sessions#destroy', via: [:get, :post]

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :categories

  resources :meetups do
    member do
      post 'vote'
    end
    resources :assistances
  end

  resources :proposals do
    member do
      post 'vote'
    end
  end

  HighVoltage.configure do |config|
    config.home_page = 'index'
  end

  match '/:username' => 'profiles#show', via: :get
end
