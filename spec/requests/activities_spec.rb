require 'rails_helper'

RSpec.describe "Activities", type: :request do

  describe "GET /api/activities" do 
    before {get '/api/activities'}

    it "should return OK" do
      payload = JSON.parse(response.body)
      expect(payload).to be_empty
      expect(response).to have_http_status(200)
    end

  end
  describe " GET /api/activities with data in the DB" do
    let!(:activities){ create_list(:activity, 10) }

    it "should return all created activities" do
      get '/api/activities'
      payload = JSON.parse(response.body)
      expect(payload.size).to eq(activities.size)
      expect(response).to have_http_status(200)
    end
  end
  describe "GET /api/activities/{id}" do 
    let!(:activity){ create(:activity) }
    
    it "should return an activity" do
      get "/api/activities/#{activity.id}"
      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(payload["id"]).to eq(activity.id)
      expect(response).to have_http_status(200)
    end
  end


end