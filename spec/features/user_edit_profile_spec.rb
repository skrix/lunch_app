require 'rails_helper'

feature 'Edit user profile' do
  let!(:user) { create(:user, :mortal) }
  let(:name)  { Faker::Internet.username(User::NAME_LENGTH) }
  before do
    sign_in user

    visit user_path(user)

    change_info
  end

  def change_info
    click_link   'Edit'
    fill_in      'Username', with: name
    click_button 'Update User'
  end

  scenario 'edit user profile' do
    expect(page).to have_content(name)
  end

  context 'when username is already taken' do
    let!(:control_user) { create(:user, :mortal) }
    let!(:former_name)  { user.username }
    let(:name)          { control_user.username }

    scenario 'does not apply new name' do
      expect(page).not_to have_content(name)
    end

    scenario 'leaves former username' do
      expect(page).to have_content(former_name)
    end
  end
end
