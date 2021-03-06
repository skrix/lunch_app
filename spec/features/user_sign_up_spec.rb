require 'rails_helper'

feature 'User signup' do
  before do
    visit new_user_registration_path
    sign_up
  end

  def sign_up
    fill_in 'Username',              with: user_params[:username]
    fill_in 'Email',                 with: user_params[:email]
    fill_in 'Password',              with: user_params[:password]
    fill_in 'Password confirmation', with: user_params[:password_confirmation]

    click_button 'Sign up'
  end

  context 'with valid attributes' do
    let(:user_params) { attributes_for(:user) }

    scenario 'user sign up' do
      expect(page).to have_content('You have signed up successfully.')
    end
  end

  context 'with invalid attributes' do
    let(:user_params) { Hash.new }

    scenario 'user sign up' do
      expect(page).to have_content('Sign up')
    end
  end
end
