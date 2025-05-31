class GenderBillsController < ApplicationController
  before_action :set_gender_bill, only: %i[ show update destroy ]

  # GET /gender_bills
  def index
    @gender_bills = GenderBill.all

    render json: @gender_bills
  end

  # GET /gender_bills/1
  def show
    render json: @gender_bill
  end

  # POST /gender_bills
  def create
    @gender_bill = GenderBill.new(gender_bill_params)

    if @gender_bill.save
      render json: @gender_bill, status: :created, location: @gender_bill
    else
      render json: @gender_bill.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gender_bills/1
  def update
    if @gender_bill.update(gender_bill_params)
      render json: @gender_bill
    else
      render json: @gender_bill.errors, status: :unprocessable_entity
    end
  end

  # DELETE /gender_bills/1
  def destroy
    @gender_bill.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gender_bill
      @gender_bill = GenderBill.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def gender_bill_params
      params.expect(gender_bill: [ :bill_id, :gender_id, :amount ])
    end
end
