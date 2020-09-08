class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    case resource
      when Admin
      admins_facilities_path
      when User
      users_post_index_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    # これではモデルがうまくとれなくエラーが出てしまう。
    # case resource
    #   when Admin
    #   new_admin_session_path
    #   when User
    #   users_root_path
    # end

    # users_root_path

    # new_admin_session_path

    # この書き方だとうまくいく
    if resource_or_scope == :admin
      new_admin_session_path
    elsif resource_or_scope == :user
      users_root_path
    end
  end

  protected
  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
