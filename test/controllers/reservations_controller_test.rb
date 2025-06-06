require "test_helper"

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reservation = reservations(:one)
  end

  test "should get index" do
    get reservations_url, as: :json
    assert_response :success
  end

  test "should create reservation" do
    assert_difference("Reservation.count") do
      post reservations_url, params: { reservation: { customer_name: @reservation.customer_name, reservation_date: @reservation.reservation_date, staff_id: @reservation.staff_id, status_master_id: @reservation.status_master_id, table_id: @reservation.table_id } }, as: :json
    end

    assert_response :created
  end

  test "should show reservation" do
    get reservation_url(@reservation), as: :json
    assert_response :success
  end

  test "should update reservation" do
    patch reservation_url(@reservation), params: { reservation: { customer_name: @reservation.customer_name, reservation_date: @reservation.reservation_date, staff_id: @reservation.staff_id, status_master_id: @reservation.status_master_id, table_id: @reservation.table_id } }, as: :json
    assert_response :success
  end

  test "should destroy reservation" do
    assert_difference("Reservation.count", -1) do
      delete reservation_url(@reservation), as: :json
    end

    assert_response :no_content
  end
end
