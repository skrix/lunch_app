require 'rails_helper'

describe ItemPolicy do
  let!(:app_admin)    { create(:user, :app_admin) }
  let!(:lunch_admin)  { create(:user, :lunch_admin) }
  let!(:resource)     { create(:item, :first) }
  let!(:not_owner)    { create(:user) }

  subject { described_class }

  permissions :index? do
    it_behaves_like 'allowed for app_admin'
    it_behaves_like 'not allowed for lunch_admin'
    it_behaves_like 'not allowed for non-owner'
  end

  permissions :show? do
    it_behaves_like 'allowed for app_admin'
    it_behaves_like 'not allowed for lunch_admin'
    it_behaves_like 'not allowed for non-owner'
  end

  permissions :update? do
    it_behaves_like 'allowed for app_admin'
    it_behaves_like 'not allowed for lunch_admin'
    it_behaves_like 'not allowed for non-owner'
  end

  permissions :create? do
    it_behaves_like 'allowed for app_admin'
    it_behaves_like 'not allowed for lunch_admin'
    it_behaves_like 'not allowed for non-owner'
  end
end
