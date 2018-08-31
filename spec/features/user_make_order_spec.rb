require 'rails_helper'

feature 'Users makes an order' do
  let!(:menu) { create(:menu, :full).decorate }
  let!(:user) { create(:user, :mortal) }

  before do
    sign_in user

    visit menu_path(menu)

    make_order
  end

  def make_order
    click_link 'New Order'

    select first,  from: 'First meal'
    select second, from: 'Second meal'
    select drink,  from: 'Drink'

    click_button 'Create Order'
  end

  context 'with valid attributes' do
    let(:first)  { menu.first_lunches.first.name }
    let(:second) { menu.second_lunches.first.name }
    let(:drink)  { menu.drinks.first.name }

    scenario 'user can create an order' do
      expect(page).to have_content('Name Kind Price')
    end
  end

  context 'with invalid attributes' do
    let(:first)  { '' }
    let(:second) { '' }
    let(:drink)  { '' }

    scenario 'it shows errors' do
      expect(page).not_to have_content('Name Kind Price')
    end
  end
end
