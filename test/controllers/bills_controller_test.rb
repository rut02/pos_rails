require "test_helper"

class BillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bill = bills(:one)
  end

  test "should get index" do
    get bills_url, as: :json
    assert_response :success
  end

  test "should create bill" do
    assert_difference("Bill.count") do
      post bills_url, params: { bill: { change: @bill.change, customer_name: @bill.customer_name, discount: @bill.discount, doc_date: @bill.doc_date, doc_no: @bill.doc_no, get_paid: @bill.get_paid, member_id: @bill.member_id, reservation_id: @bill.reservation_id, status_master_id: @bill.status_master_id, table_id: @bill.table_id, total_amount: @bill.total_amount, total_price: @bill.total_price } }, as: :json
    end

    assert_response :created
  end

  test "should show bill" do
    get bill_url(@bill), as: :json
    assert_response :success
  end

  test "should update bill" do
    patch bill_url(@bill), params: { bill: { change: @bill.change, customer_name: @bill.customer_name, discount: @bill.discount, doc_date: @bill.doc_date, doc_no: @bill.doc_no, get_paid: @bill.get_paid, member_id: @bill.member_id, reservation_id: @bill.reservation_id, status_master_id: @bill.status_master_id, table_id: @bill.table_id, total_amount: @bill.total_amount, total_price: @bill.total_price } }, as: :json
    assert_response :success
  end

  test "should destroy bill" do
    assert_difference("Bill.count", -1) do
      delete bill_url(@bill), as: :json
    end

    assert_response :no_content
  end
end
