Rails.application.routes.draw do
  HighVoltage.configure do |config|
    config.home_page = 'index'
  end
end
