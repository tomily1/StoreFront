require "rails_helper"
require "support/wait_for_ajax"

RSpec.describe "Orders" do
  let!(:product) { FactoryBot.create(:product) }
  let!(:product_1) { FactoryBot.create(:product) }
  let!(:product_1) { FactoryBot.create(:product) }

  scenario "when user visit the page, an order session is registered" do
    visit "/"
    expect(page.body).to have_text(product.name)
    expect do
      first(".add-to-cart").click
      wait_for_ajax
    end.to change { UserOrder.count }.by(1)
  end

  scenario "product can be added to cart and quantity can be changed" do
    visit "/"
    first(".add-to-cart").click
    wait_for_ajax
    visit "/carts"
    expect(page.body).to have_content product.details
  end
end