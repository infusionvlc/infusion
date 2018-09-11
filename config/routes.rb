Rails.application.routes.draw do

  match '/webhook' => 'webhook#reply', via: :post

  match 'users/auth/:provider/callback', to: 'sessions#create',        via: [:get, :post]
  match '/logout',                       to: 'sessions#destroy',       via: [:get, :post]
  match '/ranking',                      to: 'meetups#ranking',        via: [:get]
  match '/archive',                      to: 'meetups#archive',        via: [:get]
  match '/about' => 'pages#about', via: :get
  match '/rules' => 'pages#rules', via: :get
  match '/reglas' => 'pages#reglas', via: :get
  match '/regles' => 'pages#regles', via: :get
  match '/speakers' => 'pages#speakers', via: :get
  match '/schedule' => 'pages#schedule', via: :get

  match '/read_notifications',           to: 'notifications#mark_all_as_read', via: [:post]

  devise_for :users, controllers: { registrations: 'registrations' }

  devise_scope :user do
    get "/users" => "registrations#index"
  end

  resources :categories
  resources :reports
  resources :activities
  resources :locations

  resources :meetups do
    resources :sessions, :controller=>"meetup_sessions" do
      member do
        post 'vote'
        post 'unvote'
        get 'confirm'
        get 'delay'
      end

      resources :assistances
    end

    member do
      post 'leave'
    end
  end

  resources :proposals do
    member do
      post 'vote'
    end
  end

  HighVoltage.configure do |config|
    config.layout = 'pages'
  end

  match '/:username' => 'profiles#show', via: :get

  root 'meetups#index'

end
