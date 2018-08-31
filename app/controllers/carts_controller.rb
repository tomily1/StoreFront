class CartsController < ApplicationController
  before_action :setup_user_order

  def index
  end

  def create
    item = params.permit(:product, :quantity)
    commands = Commands::AddToCart.new(cart.id, item[:product], item[:quantity])

    if commands.execute
      redirect_to root_path, notice: "Product added to cart"
    else
      redirect_to root_path, alert: "Unable to add product"
    end
  end

  def update
    item = params.permit(:quantity, :id)
    commands = Commands::UpdateCart.new(item)

    if commands.execute
      redirect_to carts_path, notice: "Cart updated"
    else
      redirect_to carts_path, alert: "Unable to update cart"
    end
  end

  def destroy
  end

  private

  def setup_user_order
    create_pending_order if cart.nil?
  end

  def create_pending_order
    UserOrder.create!(session_id: current_user)
  end
end
