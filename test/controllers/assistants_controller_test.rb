require 'test_helper'

class AssistantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assistant = assistants(:one)
  end

  test "should get index" do
    get assistants_url, as: :json
    assert_response :success
  end

  test "should create assistant" do
    assert_difference('Assistant.count') do
      post assistants_url, params: { assistant: { address: @assistant.address, group: @assistant.group, name: @assistant.name, phone: @assistant.phone } }, as: :json
    end

    assert_response 201
  end

  test "should show assistant" do
    get assistant_url(@assistant), as: :json
    assert_response :success
  end

  test "should update assistant" do
    patch assistant_url(@assistant), params: { assistant: { address: @assistant.address, group: @assistant.group, name: @assistant.name, phone: @assistant.phone } }, as: :json
    assert_response 200
  end

  test "should destroy assistant" do
    assert_difference('Assistant.count', -1) do
      delete assistant_url(@assistant), as: :json
    end

    assert_response 204
  end
end
