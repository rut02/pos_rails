class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[ show update destroy ]

  # GET /reservations
  def index
    @reservations = Reservation.all
    @reservations = @reservations.map do |reservation|
      staff_name = Staff.find_by(id: reservation.staff_id)&.name || "Unknown Staff"
      table_name = Table.get_table_name(reservation.table_id)
      status_name = Reservation.get_status_name(reservation.status_master_id)
      reservation.as_json.merge({
        staff_name: staff_name,
        table_name: table_name,
        status_name: status_name})
    end

    render json: @reservations
  end
# GET /reservations/reserved
  def reserved
    @reservations = Reservation.get_reserved_reservations
    @reservations = @reservations.map do |reservation|
      staff_name = Staff.find_by(id: reservation.staff_id)&.name || "Unknown Staff"
      table_name = Table.get_table_name(reservation.table_id)
      status_name = Reservation.get_status_name(reservation.status_master_id)
      reservation.as_json.merge({
        staff_name: staff_name,
        table_name: table_name,
        status_name: status_name})
    end
    render json: @reservations
  end

  # GET /reservations/1
  def show
    render json: @reservation
  end

  # POST /reservations
  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      render json: @reservation, status: :created, location: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reservations/1
  def update
    if @reservation.update(reservation_params)
      render json: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reservations/1
  def destroy
    @reservation.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def reservation_params
      params.expect(reservation: [ :staff_id, :table_id, :customer_name, :reservation_date, :status_master_id ])
    end
end
