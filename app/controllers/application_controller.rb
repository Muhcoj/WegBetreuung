class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception

  def admin_types
    ['AdminUser']
  end
end
