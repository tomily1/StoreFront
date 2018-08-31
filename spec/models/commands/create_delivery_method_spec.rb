require "rails_helper"

RSpec.describe Commands::CreateDeliveryMethod do

  it "creates new delivery method" do
    command = described_class.new({ name: "Air", price: 20.12 })

    expect(command.valid?).to be true

    expect do
      command.execute
    end.to change { DeliveryMethod.count }.by(1)
  end
end
