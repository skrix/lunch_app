require 'rails_helper'

feature 'Edit user profile' do
  let!(:user) { create(:user, :mortal) }

  before do
    sign_in user

    visit user_path(user)

    change_info
  end

  def change_info
    click_link 'Edit'
    fill_in 'Email',    with: Faker::Internet.email
    fill_in 'Password', with: SecureRandom.base64(16)
    click_button 'Update User'
  end

  # WIP
  scenario 'edit user profile' do
    expect(page).to have_content('Sign in')
  end
end
