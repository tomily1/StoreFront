require "rails_helper"

RSpec.describe Commands::AddToCart do
  let!(:product) { FactoryBot.create(:product) }
  let!(:order) { FactoryBot.create(:user_order) }

  it "adds product to cart" do
    command = described_class.new(order.id, product.id, 20)

    expect(command.valid?).to be true

    expect do
      command.execute
    end.to change { order.carts.count }.by(1)
  end
end