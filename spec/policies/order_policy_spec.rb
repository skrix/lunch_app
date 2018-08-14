require 'rails_helper'

describe OrderPolicy do
  let!(:lunch_admin) { create(:user) }
  let!(:random_user) { create(:user) }
  let!(:mortal_user) { create(:user) }
  let!(:order)   { create(:order, user: random_user) }

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
    it 'denies access for an random_user view other user orders' do
      expect(subject).not_to permit(mortal_user, order)
    end
    it 'allows access for owner user' do
      expect(subject).to permit(random_user, order)
    end
    it 'allows access for an lunch_admin' do
      expect(subject).to permit(lunch_admin, order)
    end
  end

  permissions :update? do
    it 'denies access for an lunch_admin' do
      expect(subject).not_to permit(lunch_admin, order)
    end
    it 'denies access for an owner_user' do
      expect(subject).not_to permit(random_user, order)
    end
    it 'denies access for an random_user' do
      expect(subject).not_to permit(mortal_user, order)
    end
  end

  permissions :create? do
    it 'allows access for an lunch_admin' do
      expect(subject).to permit(lunch_admin)
    end
    it 'allows access for an owner_user' do
      expect(subject).to permit(random_user)
    end
    it 'allows access for an random_user' do
      expect(subject).to permit(mortal_user)
    end
  end
end
