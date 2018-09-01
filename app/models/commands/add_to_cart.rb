module Commands
  class AddToCart
    attr_accessor :order_id, :product_id, :quantity

    include ActiveModel::Model

    def initialize(order_id, product_id, quantity)
      @order_id = order_id
      @product_id = product_id
      @quantity = quantity.to_i
    end

    def execute
      Cart.find_or_initialize_by(user_order_id: order_id, product_id: product_id).tap do |cart|
        cart.quantity += quantity
        cart.save
      end
      true
    end
  end
end
