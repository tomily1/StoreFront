require "rails_helper"

RSpec.describe "Products" do
  scenario "can be create by users" do
    visit "/"
    click_link "Create Product"
    expect(current_path).to eq "/products/new"
    fill_in("name", with: "Test")
    fill_in("details", with: "Foo Bar")
    find("option[value='L']").click
    fill_in("price", with: 20.20)
    wait_for_ajax
    click_button "Create Product"
    wait_for_ajax
    expect(current_path).to eq "/"
    wait_for_ajax
    wait_for_ajax
    expect(page.body).to have_text "Test"
    expect(page.body).to have_text "Foo Bar"
    expect(page.body).to have_text number_to_currency(20.20)
  end
end
