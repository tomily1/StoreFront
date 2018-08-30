class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :signed_in_user?

  private

  def current_user
    return unless signed_in_user?
    @current_user ||= User.find(session[:user_id])
  rescue ActiveRecord::RecordNotFound
    reset_session
  end

  def sign_in_user!(user)
    session[:user_id] = user.id
  end

  def signed_in_user?
    session[:user_id].present?
  end
end
