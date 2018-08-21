require 'rails_helper'

feature 'Lunches Admin can browse orders' do
  let!(:lunch_admin) { create(:user, :lunch_admin) }
  let!(:order)       { create(:order) }

  before do
    sign_in lunch_admin

    visit orders_path
  end

  scenario 'Lunches Admin can browse orders' do
    expect(page).to have_content('Orders')
  end
end
