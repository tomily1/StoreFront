module Commands
  class UpdateCart
    attr_accessor :quantity, :id

    include ActiveModel::Model

    def initialize(attrs)
      super
    end

    def execute
      cart_item = Cart.find_by_id(id)
      cart_item.update(quantity: quantity)
    end
  end
end