module Commands
  class CreateDeliveryMethod
    attr_accessor :name, :price

    include ActiveModel::Model

    def initialize(attr)
      super
    end

    def execute
      DeliveryMethod.create!(name: name, price: price)
      true
    end
  end
end