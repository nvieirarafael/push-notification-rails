Rails.application.routes.draw do
  post 'register/device', to: 'push_notification#register_device'
  post 'send/message', to: 'push_notification#send_message'
end
