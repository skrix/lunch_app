require 'rails_helper'

describe ItemDecorator do
  subject { described_class.new(resource) }

  let(:resource) { create(:item) }

  describe '#item_info' do
    let(:name)  { resource.name }
    let(:price) { resource.price.to_s }

    it 'shows price and name of item' do
      expect(subject.item_info).to include(name, price)
    end
  end
end
