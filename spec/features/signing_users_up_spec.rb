require 'rails_helper'

feature 'User signup' do
  let(:valid_user_credentials)   { attributes_for(:user) }
  let(:invalid_user_credentials) do
    attributes_for(:user,
                    email: nil,
                    password: nil,
                    password_confirmation: nil)
  end

  def sign_up(user_params)
    visit '/'

    click_link 'Sign up'

    fill_in 'Email',                 with: user_params[:email]
    fill_in 'Password',              with: user_params[:password]
    fill_in 'Password confirmation', with: user_params[:password_confirmation]

    click_button 'Sign up'
  end


  scenario 'with valid credentials' do
    sign_up(valid_user_credentials)

    expect(page).to have_content('You have signed up successfully.')
  end

  scenario 'with invalid credentials' do
    sign_up(invalid_user_credentials)

    expect(page).to have_content('Sign up')
  end
end
