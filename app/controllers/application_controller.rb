class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    
  protected
  
    def after_sign_out_path_for(resources_or_scope)
      if resources_or_scope == :public
        root_path
      elsif resources_or_scope == :admin
        new_admin_session_path
      else
        root_path
      end
    end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
  end
  
end

