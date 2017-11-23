class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception

  def admin_types
    ['AdminUser']
  end

  def after_sign_in_path_for(resource)
    posts_path
  end
  
end
