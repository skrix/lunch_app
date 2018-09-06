require 'rails_helper'

feature 'Lunches Admin can create menu', js: true do
  let!(:lunch_admin) { create(:user, :lunch_admin) }
  let!(:first)       { create(:item, :first) }
  let!(:second)      { create(:item, :second) }
  let!(:drink)       { create(:item, :drink) }

  before do
    set_day_to_monday

    sign_in lunch_admin

    visit new_menu_path

    compose_menu
  end

  def set_day_to_monday
    monday = Date.today.beginning_of_week
    Timecop.travel(monday)
  end

  def compose_menu
    add_meal(first)
    add_meal(second)
    add_meal(drink)

    click_button 'Create Menu'
  end

  def add_meal(meal)
    click_link 'Add Meal'

    find_all('#meals select').last.select meal.name
  end

  scenario 'lunch_admin can create menu' do
    expect(page).to have_content('New Order')
  end

  scenario 'lunch_admin can choose meals for menu' do
    expect(page).to have_content(drink.name)
  end
end
