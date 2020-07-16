require 'rails_helper'

RSpec.describe "Babies", type: :request do

  describe "GET /api/babies" do 
    before {get '/api/babies'}

    it "should return OK" do
      payload = JSON.parse(response.body)
      expect(payload).to be_empty
      expect(response).to have_http_status(200)
    end

  end
  describe " GET /api/babies with data in the DB" do
    let!(:babies){ create_list(:baby, 10) }

    it "should return all created babies" do
      get '/api/babies'
      payload = JSON.parse(response.body)
      expect(payload.size).to eq(babies.size)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/babies/{id}" do 
    let!(:baby){ create(:baby) }
    
    it "should return a baby" do
      get "/api/babies/#{baby.id}"
      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(payload["id"]).to eq(baby.id)
      expect(response).to have_http_status(200)
    end
  end
end