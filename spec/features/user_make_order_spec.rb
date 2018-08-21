require 'rails_helper'

feature 'Users makes an order' do
  let!(:menu) { create(:menu) }
  let!(:user) { create(:user, :mortal) }

  before do
    sign_in user

    visit menu_path(menu)

    make_order
  end

  def make_order
    click_link 'New Order'
    click_button 'Create Order'
  end

  context 'with valid attributes' do
    scenario 'user can create an order' do
      expect(page).to have_content('Name Kind Price')
    end
  end

  xcontext 'with invalid attributes' do
    scenario 'it shows errors' do
    end
  end
end
