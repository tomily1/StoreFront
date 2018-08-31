module Commands
  class CreateProduct
    attr_accessor :name, :details, :size, :price

    include ActiveModel::Model

    def initialize(attr)
      super
    end

    def execute
      Product.create(
          name: name,
          details: details,
          size: size,
          price: price
      )
      true
    end
  end
end