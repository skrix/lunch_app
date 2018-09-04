require 'rails_helper'

describe 'GET /api/v1/orders' do
  let!(:orders) { create_list(:order, 10) }

  before do
    get '/api/v1/orders'
  end

  it 'returns HTTP status 200' do
    expect(response).to have_http_status 200
  end

  it 'returns all users' do
    body = JSON.parse(response.body)
    expect(body['data'].size).to eq(10)
  end
end
