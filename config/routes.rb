Rails.application.routes.draw do
  post 'register/device', to: 'push_notification#register_device'
end
