require 'rails_helper'

feature 'Lunches Admin can create menu', js: true do
  let!(:lunch_admin) { create(:user, :lunch_admin) }
  let!(:drink)       { create(:item, :drink) }
  let(:meal_price)   { '1000' }

  before do
    sign_in lunch_admin

    visit new_menu_path

    compose_menu
  end

  def compose_menu
    click_link 'Add Meal'

    fill_in 'Price ', with: meal_price
    select drink.name, from: 'Meal'

    click_button 'Create Menu'
  end

  scenario 'lunch_admin can create menu' do
    expect(page).to have_content('New Order')
  end

  scenario 'lunch_admin can choose meals for menu' do
    expect(page).to have_content(drink.name)
  end

  scenario 'lunch_admin can set meal price' do
    expect(page).to have_content(meal_price)
  end
end
