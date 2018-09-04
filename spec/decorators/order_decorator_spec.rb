require 'rails_helper'

describe OrderDecorator do
  subject { described_class.new(resource) }

  user_methods = %i[username]

  let(:time)     { Faker::Time.between(DateTime.now - 1, DateTime.now) }
  let(:resource) { create(:order, created_at: time.utc) }

  describe '#ordered_time' do
    let(:ordered) { I18n.l(time, format: :order) }

    it 'shows ordered time in appropriate format' do
      expect(subject.ordered_time).to eq(ordered)
    end
  end

  describe 'delegators' do
    user_methods.each do |method|
      it { is_expected.to respond_to(method.to_s) }
    end
  end
end
