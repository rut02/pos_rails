require "test_helper"

class GenderBillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gender_bill = gender_bills(:one)
  end

  test "should get index" do
    get gender_bills_url, as: :json
    assert_response :success
  end

  test "should create gender_bill" do
    assert_difference("GenderBill.count") do
      post gender_bills_url, params: { gender_bill: { amount: @gender_bill.amount, bill_id: @gender_bill.bill_id, gender_id: @gender_bill.gender_id } }, as: :json
    end

    assert_response :created
  end

  test "should show gender_bill" do
    get gender_bill_url(@gender_bill), as: :json
    assert_response :success
  end

  test "should update gender_bill" do
    patch gender_bill_url(@gender_bill), params: { gender_bill: { amount: @gender_bill.amount, bill_id: @gender_bill.bill_id, gender_id: @gender_bill.gender_id } }, as: :json
    assert_response :success
  end

  test "should destroy gender_bill" do
    assert_difference("GenderBill.count", -1) do
      delete gender_bill_url(@gender_bill), as: :json
    end

    assert_response :no_content
  end
end
