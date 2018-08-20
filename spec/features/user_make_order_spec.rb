require 'rails_helper'

feature 'Users makes an order' do
  let!(:menu) { create(:menu) }
  let!(:user) { create(:user, :mortal) }

  before do
    sign_in user
    visit   menus_path

    choose_menu
    make_order
  end

  def choose_menu
    click_link I18n.l(menu.created_at, format: :menu)
  end

  def make_order
    click_link 'New Order'
    click_button 'Create Order'
  end

  scenario 'user makes an order' do
    expect(page).to have_content('Name Kind Price')
  end
end
