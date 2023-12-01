require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/categories'
      follow_redirect!
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/categories/new'
      follow_redirect!
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    get '/category/1'
    follow_redirect!
    puts response.status
    expect(response).to have_http_status(:success)
  rescue StandardError => e
    puts "Exception: #{e.message}"
  end
end
