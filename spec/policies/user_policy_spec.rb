require 'rails_helper'

describe UserPolicy do
  let!(:lunch_admin) { create(:user, :lunch_admin) }
  let!(:resource)     { create(:user) }
  let!(:owner)        { resource }
  let!(:not_owner)    { create(:user) }

  subject { described_class }

  permissions :index? do
    it_behaves_like 'allowed for lunch_admin'
    it_behaves_like 'not allowed for non-owner'
  end

  permissions :show? do
    it_behaves_like 'allowed for owner'
    it_behaves_like 'allowed for lunch_admin'
    it_behaves_like 'not allowed for non-owner'
  end

  permissions :update? do
    it_behaves_like 'allowed for owner'
    it_behaves_like 'not allowed for lunch_admin'
    it_behaves_like 'not allowed for non-owner'
  end
end
