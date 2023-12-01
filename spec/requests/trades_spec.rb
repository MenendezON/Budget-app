require 'rails_helper'

RSpec.describe 'Trades', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      get '/categories/1/trades/new'
      follow_redirect!
      expect(response).to have_http_status(:success)
    end
  end
end
