module ExceptionHandler
  # provides the more graceful `included` method
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ error: "Usuario no encontrado" }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ error: "La creación ha fallado" }, :internal_server_error)
    end
  end
end
