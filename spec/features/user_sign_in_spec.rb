require 'rails_helper'

feature 'Users signin' do
  before(:each) do
    visit new_user_session_path
  end

  let!(:user)         { create(:user) }

  def sign_in(user)

    fill_in 'Email',    with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign in'
  end

  scenario 'user sign in' do
    sign_in(user)

    expect(page).to have_content('Signed in successfully.')

    expect(page).not_to have_link('Sign in')
    expect(page).not_to have_link('Sign up')
  end
end
