require "test_helper"

class AgeRangeBillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @age_range_bill = age_range_bills(:one)
  end

  test "should get index" do
    get age_range_bills_url, as: :json
    assert_response :success
  end

  test "should create age_range_bill" do
    assert_difference("AgeRangeBill.count") do
      post age_range_bills_url, params: { age_range_bill: { age_range_id: @age_range_bill.age_range_id, amount: @age_range_bill.amount, bill_id: @age_range_bill.bill_id } }, as: :json
    end

    assert_response :created
  end

  test "should show age_range_bill" do
    get age_range_bill_url(@age_range_bill), as: :json
    assert_response :success
  end

  test "should update age_range_bill" do
    patch age_range_bill_url(@age_range_bill), params: { age_range_bill: { age_range_id: @age_range_bill.age_range_id, amount: @age_range_bill.amount, bill_id: @age_range_bill.bill_id } }, as: :json
    assert_response :success
  end

  test "should destroy age_range_bill" do
    assert_difference("AgeRangeBill.count", -1) do
      delete age_range_bill_url(@age_range_bill), as: :json
    end

    assert_response :no_content
  end
end
