class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  # before_action :authenticate_user!
  
  # Incluir Gon en todos los controladores
  include Gon::ControllerHelpers

  ## Redirigir al dashboard de usuario después de iniciar sesion
  def after_sign_in_path_for(resource)
    dashboard_index_path
  end
end