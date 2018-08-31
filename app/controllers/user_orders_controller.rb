class UserOrdersController < ApplicationController
  def update
    user_order = UserOrder.find_by_id(params[:id])
    shipping = DeliveryMethod.where(name: params[:name]).first
    return if shipping.nil?
    user_order.update(delivery_method_id: shipping.id)
    redirect_to carts_path
  end

  def payment
    user_order = UserOrder.find_by_id(params[:user_order_id])
    user_order.update(date_order_paid: Time.now)
    redirect_to root_path, notice: "Payment made"
  end
end
