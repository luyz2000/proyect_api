require 'test_helper'

class ActivityLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @activity_log = activity_logs(:one)
  end

  test "should get index" do
    get activity_logs_url, as: :json
    assert_response :success
  end

  test "should create activity_log" do
    assert_difference('ActivityLog.count') do
      post activity_logs_url, params: { activity_log: { activity_id: @activity_log.activity_id, assistant_id: @activity_log.assistant_id, baby_id: @activity_log.baby_id, comments: @activity_log.comments, duration: @activity_log.duration, name: @activity_log.name, start_time: @activity_log.start_time, stop_time: @activity_log.stop_time } }, as: :json
    end

    assert_response 201
  end

  test "should show activity_log" do
    get activity_log_url(@activity_log), as: :json
    assert_response :success
  end

  test "should update activity_log" do
    patch activity_log_url(@activity_log), params: { activity_log: { activity_id: @activity_log.activity_id, assistant_id: @activity_log.assistant_id, baby_id: @activity_log.baby_id, comments: @activity_log.comments, duration: @activity_log.duration, name: @activity_log.name, start_time: @activity_log.start_time, stop_time: @activity_log.stop_time } }, as: :json
    assert_response 200
  end

  test "should destroy activity_log" do
    assert_difference('ActivityLog.count', -1) do
      delete activity_log_url(@activity_log), as: :json
    end

    assert_response 204
  end
end
