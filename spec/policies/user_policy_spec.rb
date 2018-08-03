require 'rails_helper'

RSpec.describe UserPolicy do
  let!(:lunch_admin) { create(:user) }
  let!(:random_user) { create(:user) }

  subject { described_class }

  permissions :index? do
    it 'denies access if not an lunch_admin' do
      expect(subject).not_to permit(random_user)
    end
    it 'allows access for an lunch_admin' do
      expect(subject).to permit(lunch_admin)
    end
  end

  permissions :show? do
    it 'denies access for an random_user view other user profile' do
      expect(subject).not_to permit(random_user, create(:user))
    end
    it 'allows access for user' do
      expect(subject).to permit(random_user, random_user)
    end
    it 'allows access for an lunch_admin' do
      expect(subject).to permit(lunch_admin, random_user)
    end
  end

  permissions :update? do
    it 'denies access for an lunch_admin' do
      expect(subject).not_to permit(lunch_admin, random_user)
    end
    it 'denies access for an random_user view other user profile' do
      expect(subject).not_to permit(random_user, create(:user))
    end
    it 'allows access for user' do
      expect(subject).to permit(random_user, random_user)
    end
  end
end
