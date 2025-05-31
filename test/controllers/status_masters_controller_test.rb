require "test_helper"

class StatusMastersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @status_master = status_masters(:one)
  end

  test "should get index" do
    get status_masters_url, as: :json
    assert_response :success
  end

  test "should create status_master" do
    assert_difference("StatusMaster.count") do
      post status_masters_url, params: { status_master: { name: @status_master.name } }, as: :json
    end

    assert_response :created
  end

  test "should show status_master" do
    get status_master_url(@status_master), as: :json
    assert_response :success
  end

  test "should update status_master" do
    patch status_master_url(@status_master), params: { status_master: { name: @status_master.name } }, as: :json
    assert_response :success
  end

  test "should destroy status_master" do
    assert_difference("StatusMaster.count", -1) do
      delete status_master_url(@status_master), as: :json
    end

    assert_response :no_content
  end
end
