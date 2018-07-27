require 'rails_helper'

RSpec.feature 'User signup' do
  let(:user_params) { FactoryBot.attributes_for(:valid_user_for_registration) }

  scenario 'with valid credentials' do
    visit '/'

    click_link 'Sign up'

    fill_in 'Email',                 with: user_params.email
    fill_in 'Password',              with: user_params.password
    fill_in 'Password confirmation', with: user_params.password_confirmation

    click_button 'Sign up'
    expect(page).to have_content('You have signed up successfully.')
  end

  scenario 'with invalid credentials' do
    visit '/'

    click_link 'Sign up'

    fill_in 'Email',                 with: ''
    fill_in 'Password',              with: ''
    fill_in 'Password confirmation', with: ''

    click_button 'Sign up'
    expect(page).to have_content('You haven\'t signed up successfully.')
  end
end
