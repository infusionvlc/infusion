Rails.application.routes.draw do

  match 'users/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match '/logout', to: 'sessions#destroy', via: [:get, :post]
  
  devise_for :users
  
  HighVoltage.configure do |config|
    config.home_page = 'index'
  end
end
