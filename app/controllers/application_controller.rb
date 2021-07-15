class ApplicationController < ActionController::Base
  before_action :configure_permited_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: :index

  
  
  private

  def configure_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :l_kana, :f_kana, :birthday])
  end
end
