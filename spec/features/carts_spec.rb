require "rails_helper"

RSpec.describe "Orders" do
  let!(:product) { FactoryBot.create(:product) }
  let!(:product_2) { FactoryBot.create(:product) }
  let!(:user_order) { FactoryBot.create(:user_order)}
  let!(:cart) { FactoryBot.create(:cart)}
  let!(:delivery) { FactoryBot.create(:delivery_method) }

  scenario "user can add product to cart and make payment" do
    visit "/"
    first(".add-to-cart").click
    wait_for_ajax
    visit "/carts"
    wait_for_ajax
    wait_for_ajax
    expect(page.body).to have_content product.details
    expect(page.body).to have_text product.price
    expect(page.body).to have_text "Select shipping method"
    find("option[value='#{delivery.name}']").click
    wait_for_ajax
    expect(page.body).to have_link "Make Payment"

    total = product.price + (product.price * 0.066) + delivery.price

    expect(page.body).to have_text(number_to_currency(total))
    expect(page.body).to have_text(number_to_currency(product.price * 0.066))
    expect(page.body).to have_text(number_to_currency(product.price))
    click_link "Make Payment"
    wait_for_ajax
    expect(current_path).to eq "/"
  end

  scenario "user can remove item from cart" do
    visit "/"
    first(".add-to-cart").click
    wait_for_ajax
    visit "/carts"
    wait_for_ajax
    expect(page.body).to have_content product.details
    click_link "Remove Item"
    visit "/carts"
    expect(page.body).to have_content "Cart is currently empty, add products here"
  end

  scenario "user can change quantity of items in cart" do
    visit "/"
    first(".quick-view").click
    fill_in("quantity", with: 2)
    find(".quick-view-add").click
    wait_for_ajax
    visit "/carts"
    expect(page.body).to have_text("Quantity:  2")
    total_price = product.price * 2
    expect(page.body).to have_text(number_to_currency(total_price))
  end
end
