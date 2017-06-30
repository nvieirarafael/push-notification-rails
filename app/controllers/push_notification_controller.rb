class PushNotificationController < ActionController::API

  def register_device
    device = Device.find_or_create_by register: params[:register]

    render json: {
      message: 'Registro efetuado com sucesso!',
      device: device
    }
  end

end
