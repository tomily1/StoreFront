require "rails_helper"

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
      wait_for_ajax
    end.to change { UserOrder.count }.by(1)
  end

  scenario "when there are no products in cart" do
    visit "/carts"
    expect(page.body).to have_content "Cart is currently empty, add products here"
  end
end