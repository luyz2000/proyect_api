require 'rails_helper'

RSpec.describe "Activity Logs", type: :request do

  describe "GET /api/activity_logs" do 
    before {get '/api/activity_logs'}

    it "should return OK" do
      payload = JSON.parse(response.body)
      expect(payload).to be_empty
      expect(response).to have_http_status(200)
    end

  end
  describe " GET /api/activity_logs with data in the DB" do
    let!(:activity_logs){ create_list(:activity_log, 10) }

    it "should return all created activity logs" do
      get '/api/activity_logs'
      payload = JSON.parse(response.body)
      expect(payload.size).to eq(activity_logs.size)
      expect(response).to have_http_status(200)
    end
  end
  

  describe "POST /api/activity_logs" do
    let!(:baby){create(:baby)}
    let!(:assistant){create(:assistant)}
    let!(:activity){create(:activity)}
    it "should create an activity_log" do 
      req_paylod = {
        activity_log: {
          baby_id: baby.id,
          assistant_id: assistant.id,
          activity_id: activity.id,
          start_time: "2017-04-03T21:21:09Z",
          stop_time:"2017-04-03T21:49:09Z",
          duration: "10 minutes",
          name: "Pedro Perez",
          comments: "Comments"
        }
      }
      post "/api/activity_logs", params: req_paylod
      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(payload["id"]).to_not be_nil
      expect(response).to have_http_status(:created)
    end

    it "shouldn't create activity log with wrong data" do
      req_paylod = {
        activity_log: {
          assistant_id: assistant.id,
          activity_id: activity.id,
          start_time: "2017-04-03T21:21:09Z",
          stop_time:"2017-04-03T21:49:09Z",
          duration: "10 minutes",
          name: "Pedro Perez",
          comments: "Comments"
        }
      }
      post "/api/activity_logs", params: req_paylod
      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "PUT /api/activity_logs/{id}" do
    let!(:activity_log){ create(:activity_log) }

    it "should update an activity_log" do 
      req_paylod = {
        activity_log: {
          name: "Raúl Perez"
        }
      }
      put "/api/activity_logs/#{activity_log.id}", params: req_paylod
      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(payload["id"]).to eq(activity_log.id)
      expect(response).to have_http_status(:ok)
    end
  end

end