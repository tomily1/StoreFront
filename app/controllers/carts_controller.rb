class CartsController < ApplicationController
  before_action :setup_user_order

  def index
  end

  def create
    item = params.permit(:product)
    Commands::AddToCart.new(cart.id, item)
  end

  def destroy
  end

  private

  def setup_user_order
    create_pending_order if pending_order.nil?
  end

  def create_pending_order
    UserOrder.create!(user_id: current_user)
  end
end
