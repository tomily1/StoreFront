module Commands
  class AddToCart
    attr_accessor :order_id, :product_id

    include ActiveModel::Model

    def initialize(order_id, product_id)
      @order_id = order_id
      @product_id = product_id
    end

    def execute
      Cart.create!(user_orders_id: order_id, product_id: product_id)
      true
    end
  end
end