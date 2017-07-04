require 'fcm'

class PushNotificationController < ActionController::API

  FCMServerKey = 'xxxxxxxxxxxxxxxxxxxx'.freeze

  def register_device
    device = Device.find_or_create_by register: params[:register]

    render json: {
      message: 'Registro efetuado com sucesso!',
      device: device
    }
  end

  def send_message
    fcm = FCM.new(FCMServerKey, proxy_options)

    registration_ids = Device.pluck(:register)

    payload = { message: params[:message] }

    options = {
      data: payload,
      collapse_key: 'updated_score'
    }

    fcm.send(registration_ids, options)

    render plain: "Mensagens enviadas para [#{registration_ids.join(', ')}]"
  end

  private

  # Caso seu serviço esteja rodando por de trás de um proxy
  # Você pode configurar-lo neste método
  def proxy_options
    {
      # http_proxyaddr: 'xxxx.xxx.xxx.xx',
      # http_proxyport: 'xxxx'
    }
  end

end
