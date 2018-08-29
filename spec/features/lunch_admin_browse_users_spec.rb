require 'rails_helper'

feature 'Lunches Admin can browse users' do
  let!(:lunch_admin) { create(:user, :lunch_admin) }
  let!(:user)        { create(:user, :mortal) }

  before do
    sign_in lunch_admin

    visit users_path
  end

  scenario 'Lunches Admin can browse registered users' do
    expect(page).to have_content(user.email)
  end
end
