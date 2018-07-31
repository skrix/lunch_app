require 'rails_helper'

feature 'Users signin' do
  before(:each) do
    visit new_user_session_path
  end

  let!(:user)         { create(:user) }
  let!(:invalid_user) { build(:invalid_user_without_email) }

  def sign_in(user)

    fill_in 'Email',    with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign in'
  end

  context 'with valid attributes' do
    scenario 'user sign in' do
      sign_in(user)

      expect(page).to have_content('Signed in successfully.')

      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end

  context 'with invalid attributes' do
    scenario 'user sign in' do
      sign_in(invalid_user)

      expect(page).to have_content('Invalid Email or password.')

      expect(page).to have_link('Sign up')
      expect(page).to have_link('Forgot your password?')
    end
  end
end
