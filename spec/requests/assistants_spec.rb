require 'rails_helper'

RSpec.describe "Assistans", type: :request do

  describe "GET /api/assistants" do 
    before {get '/api/assistants'}

    it "should return OK" do
      payload = JSON.parse(response.body)
      expect(payload).to be_empty
      expect(response).to have_http_status(200)
    end

  end
  describe " GET /api/assistants with data in the DB" do
    let!(:assistants){ create_list(:assistant, 10) }

    it "should return all created assistants" do
      get '/api/assistants'
      payload = JSON.parse(response.body)
      expect(payload.size).to eq(assistants.size)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/assistants/{id}" do 
    let!(:assistant){ create(:assistant) }
    
    it "should return an assistant" do
      get "/api/assistants/#{assistant.id}"
      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(payload["id"]).to eq(assistant.id)
      expect(response).to have_http_status(200)
    end
  end
end