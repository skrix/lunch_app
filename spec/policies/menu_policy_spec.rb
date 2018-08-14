require 'rails_helper'

describe MenuPolicy do
  let!(:lunch_admin) { create(:user) }
  let!(:random_user) { create(:user) }
  let!(:menu)        { create(:menu) }

  subject { described_class }

  permissions :index? do
    it 'allows access if not an lunch_admin' do
      expect(subject).to permit(random_user)
    end
    it 'allows access for an lunch_admin' do
      expect(subject).to permit(lunch_admin)
    end
  end

  permissions :show? do
    it 'allows access for owner user' do
      expect(subject).to permit(random_user, menu)
    end
    it 'allows access for an lunch_admin' do
      expect(subject).to permit(lunch_admin, menu)
    end
  end

  permissions :update? do
    it 'allows access for an lunch_admin' do
      expect(subject).to permit(lunch_admin, menu)
    end
    it 'denies access for an random_user' do
      expect(subject).not_to permit(random_user, menu)
    end
  end

  permissions :create? do
    it 'allows access for an lunch_admin' do
      expect(subject).to permit(lunch_admin)
    end
    it 'denies access for an random_user' do
      expect(subject).not_to permit(random_user)
    end
  end

  permissions :new? do
    it 'allows access for an lunch_admin' do
      expect(subject).to permit(lunch_admin)
    end
    it 'denies access for an random_user' do
      expect(subject).not_to permit(random_user)
    end
  end
end
