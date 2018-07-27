require 'rails_helper'

RSpec.feature 'Users signin' do
  let(:valid_user)   { FactoryBot.build(:valid_user) }
  let(:invalid_user) { FactoryBot.build(:invalid_user_without_email) }

  def sign_in(user)
    visit '/'

    click_link 'Sign in'

    fill_in 'Email',    with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
  end

  scenario 'with valid credentials' do
    sign_in(valid_user)

    expect(page).to have_content('Signed in successfully.')
    expect(page).to have_content("Signed in as #{valid_user.email}")

    expect(page).not_to have_link('Sign in')
    expect(page).not_to have_link('Sign up')
  end

  scenario 'with invalid credentials' do
    sign_in(invalid_user)

    expect(page).to have_content('Invalid Email or password.')

    expect(page).to have_link('Sign in')
    expect(page).to have_link('Sign up')
    expect(page).to have_link('Forgot your password?')
  end
end
