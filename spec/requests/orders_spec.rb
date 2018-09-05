require 'rails_helper'

describe 'GET /api/v1/orders' do
  let!(:count)  { rand(1..10) }
  let!(:orders) { create_list(:order, count) }
  let!(:user)   { create(:user, :with_token) }

  before do
    get '/api/v1/orders', headers: {
      'X-User-Email': user.email,
      'X-User-Token': user.authentication_token
    }
  end

  it 'returns HTTP status 200' do
    expect(response).to have_http_status 200
  end

  it 'returns all orders' do
    body = JSON.parse(response.body)
    expect(body['data'].size).to eq(count)
  end
end
