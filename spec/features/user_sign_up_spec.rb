require 'rails_helper'

feature 'User signup' do
  before { visit new_user_registration_path }

  def sign_up
    fill_in 'Email',                 with: user_params[:email]
    fill_in 'Password',              with: user_params[:password]
    fill_in 'Password confirmation', with: user_params[:password_confirmation]

    click_button 'Sign up'
  end

  context 'with valid attributes' do
    let(:user_params) { attributes_for(:user) }

    scenario 'user sign up' do
      sign_up
      expect(page).to have_content('You have signed up successfully.')
    end
  end

  context 'with invalid attributes' do
    let(:user_params) { {} }

    scenario 'user sign up' do
      sign_up
      expect(page).to have_content('Sign up')
    end
  end
end
