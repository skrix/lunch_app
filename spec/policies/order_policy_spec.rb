require 'rails_helper'

describe OrderPolicy do
  let!(:lunch_admin)  { create(:user, :lunch_admin) }
  let!(:owner)        { create(:user) }
  let!(:not_owner)    { create(:user) }
  let!(:resource)     { create(:order, user: owner) }

  subject { described_class }

  permissions :index? do
    it_behaves_like 'allowed for lunch_admin'
    it_behaves_like 'not allowed for non-owner'
  end

  permissions :show? do
    it_behaves_like 'allowed for lunch_admin'
    it_behaves_like 'allowed for owner'
    it_behaves_like 'not allowed for non-owner'
  end

  permissions :update? do
    it_behaves_like 'not allowed for lunch_admin'
    it_behaves_like 'not allowed for non-owner'
    it_behaves_like 'not allowed for owner'
  end

  permissions :create? do
    it_behaves_like 'allowed for lunch_admin'
    it_behaves_like 'allowed for non-owner'
    it_behaves_like 'allowed for owner'
  end
end
