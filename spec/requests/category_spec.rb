require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/category/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/category/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/category/show'
      expect(response).to have_http_status(:success)
    end
  end
end
