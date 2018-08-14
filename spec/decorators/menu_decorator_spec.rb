require 'rails_helper'

describe MenuDecorator do
  subject { described_class.new(resource) }

  item_methods = %i[name kind]

  let(:resource) { create(:menu) }

  describe 'delegators' do
    item_methods.each do |method|
      it { is_expected.to respond_to("item_#{method}".to_s) }
    end
  end
end

