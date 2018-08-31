# frozen_string_literal: true

require 'spec_helper'

shared_examples 'allowed for owner' do
  let(:policy_resource_class) { respond_to?(:resource_class) ? resource_class : nil }
  let(:policy_resource)       { respond_to?(:resource) ? resource : policy_resource_class&.new }
  let(:policy_owner)          { respond_to?(:owner) && owner }
  let(:policy_not_owner)      { respond_to?(:not_owner) && not_owner }

  it { should permit(policy_owner, policy_resource) }
end

shared_examples 'allowed for lunch_admin' do
  let(:policy_resource_class) { respond_to?(:resource_class) ? resource_class : nil }
  let(:policy_resource)       { respond_to?(:resource) ? resource : policy_resource_class&.new }
  let(:policy_owner)          { respond_to?(:owner) && owner }
  let(:policy_lunch_admin)    { respond_to?(:lunch_admin) && lunch_admin }

  it { should permit(policy_lunch_admin, policy_resource) }
end

shared_examples 'allowed for app_admin' do
  let(:policy_resource_class) { respond_to?(:resource_class) ? resource_class : nil }
  let(:policy_resource)       { respond_to?(:resource) ? resource : policy_resource_class&.new }
  let(:policy_owner)          { respond_to?(:owner) && owner }
  let(:policy_app_admin)      { respond_to?(:app_admin) && app_admin }

  it { should permit(policy_app_admin, policy_resource) }
end

shared_examples 'allowed for non-owner' do
  let(:policy_resource_class) { respond_to?(:resource_class) ? resource_class : nil }
  let(:policy_resource)       { respond_to?(:resource) ? resource : policy_resource_class&.new }
  let(:policy_owner)          { respond_to?(:owner) && owner }
  let(:policy_not_owner)      { respond_to?(:not_owner) && not_owner }

  it { should permit(policy_not_owner, policy_resource) }
end

shared_examples 'not allowed for non-owner' do
  let(:policy_resource_class) { respond_to?(:resource_class) ? resource_class : nil }
  let(:policy_resource)       { respond_to?(:resource) ? resource : policy_resource_class&.new }
  let(:policy_owner)          { respond_to?(:owner) && owner }
  let(:policy_not_owner)      { respond_to?(:not_owner) && not_owner }

  it { should_not permit(policy_not_owner, policy_resource) }
end

shared_examples 'not allowed for owner' do
  let(:policy_resource_class) { respond_to?(:resource_class) ? resource_class : nil }
  let(:policy_resource)       { respond_to?(:resource) ? resource : policy_resource_class&.new }
  let(:policy_owner)          { respond_to?(:owner) && owner }
  let(:policy_not_owner)      { respond_to?(:not_owner) && not_owner }

  it { should_not permit(policy_owner, policy_resource) }
end

shared_examples 'not allowed for lunch_admin' do
  let(:policy_resource_class) { respond_to?(:resource_class) ? resource_class : nil }
  let(:policy_resource)       { respond_to?(:resource) ? resource : policy_resource_class&.new }
  let(:policy_owner)          { respond_to?(:owner) && owner }
  let(:policy_lunch_admin)    { respond_to?(:lunch_admin) && lunch_admin }

  it { should_not permit(policy_lunch_admin, policy_resource) }
end
