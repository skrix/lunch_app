require 'rails_helper'

describe ItemPolicy do
  let!(:app_admin)   { create(:user, :app_admin) }
  let!(:lunch_admin) { create(:user) }
  let!(:random_user) { create(:user) }
  let!(:item)        { create(:item, :first) }

  subject { described_class }

  permissions :index? do
    it 'allows access for a app_admin' do
      expect(subject).to permit(app_admin)
    end
    it 'denies access for a random_user' do
      expect(subject).not_to permit(random_user)
    end
    it 'denies access for a lunch_admin' do
      expect(subject).not_to permit(lunch_admin)
    end
  end

  permissions :show? do
    it 'allows access for a app_admin' do
      expect(subject).to permit(app_admin, item)
    end
    it 'denies access for a random_user' do
      expect(subject).not_to permit(random_user, item)
    end
    it 'denies access for a lunch_admin' do
      expect(subject).not_to permit(lunch_admin, item)
    end
  end

  permissions :update? do
    it 'allows access for a app_admin' do
      expect(subject).to permit(app_admin, item)
    end
    it 'denies access for a random_user' do
      expect(subject).not_to permit(random_user, item)
    end
    it 'denies access for a lunch_admin' do
      expect(subject).not_to permit(lunch_admin, item)
    end
  end

  permissions :create? do
    it 'allows access for a app_admin' do
      expect(subject).to permit(app_admin)
    end
    it 'denies access for a random_user' do
      expect(subject).not_to permit(random_user)
    end
    it 'denies access for a lunch_admin' do
      expect(subject).not_to permit(lunch_admin)
    end
  end
end
