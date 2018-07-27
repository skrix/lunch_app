require 'rails_helper'

RSpec.feature 'User signup' do
  # let(:valid_user_credentials)   { FactoryBot.attributes_for(:valid_user) }
  let(:invalid_user_credentials) { FactoryBot.attributes_for(:invalid_user) }

  def sign_up(user_params)
    visit '/'

    click_link 'Sign up'

    fill_in 'Email',                 with: user_params[:email]
    fill_in 'Password',              with: user_params[:password]
    fill_in 'Password confirmation', with: user_params[:password_confirmation]

    click_button 'Sign up'
  end


  scenario 'with valid credentials' do
    valid_user_credentials = FactoryBot.attributes_for(:valid_user)
    sign_up(valid_user_credentials)

    expect(page).to have_content('You have signed up successfully.')
  end

  scenario 'with invalid credentials' do
    sign_up(invalid_user_credentials)

    expect(page).to have_content('Sign up')
  end
end
