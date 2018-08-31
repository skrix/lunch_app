require 'rails_helper'

describe OrderMealDecorator do
  subject { described_class.new(resource) }

  meal_methods = %i[name kind price]

  let(:resource) { create(:order_meal, :with_order) }

  describe 'delegators' do
    meal_methods.each do |method|
      it { is_expected.to respond_to("meal_#{method}".to_s) }
    end
  end
end
