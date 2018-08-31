class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :cart

  private

  def current_user
    @current_user = session[:session_id]
  end

  def cart
    @cart = UserOrder.where(session_id: current_user, date_order_paid: nil).first
  end
end
