Rails.application.routes.draw do
  get 'register/device', to: 'push_notification#register_device'
end
