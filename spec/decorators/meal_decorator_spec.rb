require 'rails_helper'

describe MealDecorator do
  subject { described_class.new(resource) }

  delegated_methods = %i[name kind]

  let(:resource) { create(:meal, :first) }

  describe '#meal_info' do
    let(:meal_item) { resource.item }
    let(:name)      { meal_item.name }
    let(:price)     { resource.price.to_s }

    it 'shows price and name of a meal' do
      expect(subject.meal_info).to include(name, price)
    end
  end

  describe 'delegators' do
    delegated_methods.each do |method|
      it { is_expected.to respond_to(method) }
    end
  end
end
