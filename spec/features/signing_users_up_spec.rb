require 'rails_helper'

feature 'User signup' do
  before(:each) do
    visit new_user_registration_path
  end

  let(:user_attributes)         { attributes_for(:user) }
  let(:invalid_user_attributes) { {} }

  def sign_up(user_params)

    fill_in 'Email',                 with: user_params[:email]
    fill_in 'Password',              with: user_params[:password]
    fill_in 'Password confirmation', with: user_params[:password_confirmation]

    click_button 'Sign up'
  end

  context 'with valid attributes' do
    scenario 'user sign up' do
      sign_up(user_attributes)

      expect(page).to have_content('You have signed up successfully.')
    end
  end

  context 'with invalid attributes' do
    scenario 'user sign up' do
      sign_up(invalid_user_attributes)

      expect(page).to have_content('Sign up')
    end
  end
end
