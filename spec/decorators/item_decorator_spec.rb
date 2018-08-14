require 'rails_helper'

describe ItemDecorator do
  subject { described_class.new(resource) }

  let(:resource) { create(:item) }
  let(:info)     { [name, price].join(' - ') }

  describe '#item_info' do
    let(:name)  { resource.name }
    let(:price) { resource.price }

    it 'shows price and name of item' do
      expect(subject.item_info).to eq(info)
    end
  end
end
