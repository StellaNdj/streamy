class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  helper_method :current_user, :user_signed_in?

  def after_sign_out_path_for(resource_or_scope)
    new_user_registration_path
  end
end
