Rails.application.routes.draw do

  match 'users/auth/:provider/callback', to: 'sessions#create',        via: [:get, :post]
  match '/logout',                       to: 'sessions#destroy',       via: [:get, :post]
  match '/call_for_talks',               to: 'meetups#call_for_talks', via: [:get]
  match '/archive',                      to: 'meetups#archive',        via: [:get]

  devise_for :users, controllers: { registrations: 'registrations' }

  devise_scope :user do
    get "/users" => "registrations#index"
  end

  resources :categories
  resources :reports
  resources :activities
  resources :locations

  resources :meetups do
    member do
      post 'vote'
      get 'confirm'
      get 'delay'
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
    config.layout = 'pages'
  end

  match '/:username' => 'profiles#show', via: :get
end
