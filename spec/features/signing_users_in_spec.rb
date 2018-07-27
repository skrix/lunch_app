require 'rails_helper'

RSpec.feature 'Users signin' do
  let(:valid_user) { FactoryBot.build(:valid_user) }
  let(:invalid_user) { FactoryBot.build(:invalid_user_without_email) }

  scenario 'with valid credentials' do
    visit '/'

    click_link 'Sign in'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    expect(page).to have_content('Signed in successfully.')
    expect(page).to have_content("Signed in as #{user.email}")

    expect(page).not_to have_link('Sign in')
    expect(page).not_to have_link('Sign up')
  end

  scenario 'with invalid credentials' do
    visit '/'

    click_link 'Sign in'

    fill_in 'Email', with: invalid_user.email
    fill_in 'Password', with: invalid_user.password

    click_button 'Log in'

    expect(page).to have_content('Invalid Email or password.')

    expect(page).to have_link('Sign in')
    expect(page).to have_link('Sign up')
    expect(page).to have_link('Forgot your password?')

  end
end
