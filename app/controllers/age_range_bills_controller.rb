class AgeRangeBillsController < ApplicationController
  before_action :set_age_range_bill, only: %i[ show update destroy ]

  # GET /age_range_bills
  def index
    @age_range_bills = AgeRangeBill.all

    render json: @age_range_bills
  end

  # GET /age_range_bills/1
  def show
    render json: @age_range_bill
  end

  # POST /age_range_bills
  def create
    @age_range_bill = AgeRangeBill.new(age_range_bill_params)

    if @age_range_bill.save
      render json: @age_range_bill, status: :created, location: @age_range_bill
    else
      render json: @age_range_bill.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /age_range_bills/1
  def update
    if @age_range_bill.update(age_range_bill_params)
      render json: @age_range_bill
    else
      render json: @age_range_bill.errors, status: :unprocessable_entity
    end
  end

  # DELETE /age_range_bills/1
  def destroy
    @age_range_bill.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_age_range_bill
      @age_range_bill = AgeRangeBill.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def age_range_bill_params
      params.expect(age_range_bill: [ :bill_id, :age_range_id, :amount ])
    end
end
