require "rails_helper"

RSpec.describe Commands::CreateProduct do

  it "should create new product" do
    command = described_class.new({ name: "Iphone", details: "Test Product", size: "N/A", price: 20.20 })
    expect(command.valid?).to be true

    expect do
      command.execute
    end.to change { Product.count }.by(1)
  end
end
