require "rails_helper"

RSpec.describe Commands::UpdateCart do
  let!(:cart) { FactoryBot.create(:cart) }

  it "should update cart product quantities" do
    command = described_class.new({quantity: 20, id: cart.id})

    expect(command.valid?).to be true
    command.execute
    cart.reload
    expect(cart.quantity).to eq 20
  end
end