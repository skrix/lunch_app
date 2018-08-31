require 'rails_helper'

describe MenuPolicy do
  let!(:lunch_admin)  { create(:user, :lunch_admin) }
  let!(:resource)     { create(:menu) }
  let!(:not_owner)    { create(:user) }

  subject { described_class }

  permissions :index? do
    it_behaves_like 'allowed for lunch_admin'
    it_behaves_like 'allowed for non-owner'
  end

  permissions :show? do
    it_behaves_like 'allowed for lunch_admin'
    it_behaves_like 'allowed for non-owner'
  end

  permissions :update? do
    it_behaves_like 'allowed for lunch_admin'
    it_behaves_like 'not allowed for non-owner'
  end

  permissions :create? do
    it_behaves_like 'allowed for lunch_admin'
    it_behaves_like 'not allowed for non-owner'
  end

  permissions :new? do
    it_behaves_like 'allowed for lunch_admin'
    it_behaves_like 'not allowed for non-owner'
  end
end
