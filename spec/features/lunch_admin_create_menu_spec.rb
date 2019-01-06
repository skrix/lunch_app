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
  end

  def set_day_to_monday
    monday = Date.today.beginning_of_week
    Timecop.travel(monday)
  end

  def create_menu
    click_button 'Create Menu'
  end

  def edit_menu
    click_link 'Edit'
  end

  def add_meal(meal)
    click_link I18n.t('menus.form.add_meal')

    find_all('#meals select').last.select meal.name
  end

  scenario 'lunch_admin can create menu' do
    add_meal(first)
    add_meal(second)
    add_meal(drink)
    create_menu

    expect(page).to have_link(I18n.t('menus.show.buttons.new_order'))
  end

  scenario 'lunch_admin can choose meals for menu' do
    add_meal(first)
    add_meal(second)
    add_meal(drink)
    create_menu

    expect(page).to have_content(drink.name)
  end

  context 'after create menu' do
    let!(:additional_meal) { create(:item, :drink) }

    scenario 'lunch_admin can edit menu' do
      add_meal(first)
      add_meal(second)
      add_meal(drink)
      create_menu

      edit_menu
      add_meal(additional_meal)

      expect(page).to have_content(additional_meal.name)
    end
  end

  context 'with invalid params' do
    scenario 'lunch_admin can not create empty menu' do
      create_menu

      expect(page).to have_content(I18n.t('validations.menu.invalid'))
    end

    scenario 'lunch_admin can not create not full menu' do
      add_meal(first)
      add_meal(second)
      create_menu

      expect(page).to have_content(I18n.t('validations.menu.invalid'))
    end
  end
end
