require 'rails_helper'

feature 'Users signin' do
  let!(:user) { create(:user) }

  before do
    visit new_user_session_path
    sign_in
  end

  def sign_in
    fill_in 'Email',    with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign in'
  end

  scenario 'user sign in' do
    expect(page).to have_content('Signed in successfully.')
  end
end
