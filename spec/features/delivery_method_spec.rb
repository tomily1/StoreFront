require "rails_helper"

RSpec.describe "Delivery Methods" do
  scenario "can be created by users" do
    visit "/"
    click_link "Delivery Methods"
    expect(current_path).to eq "/delivery_methods"
    fill_in("name", with: "Test")
    fill_in("price", with: 20.20)
    click_button "Save"
    wait_for_ajax
    visit current_path
    expect(current_path).to eq "/delivery_methods"
    expect(page.body).to have_text "Test"
    expect(page.body).to have_text number_to_currency(20.20)
  end
end
