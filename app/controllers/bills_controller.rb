class BillsController < ApplicationController
  before_action :set_bill, only: %i[ show update destroy ]

  # GET /bills
  def index
    @bills = Bill.all.as_json

    render json: @bills
  end

  # GET /bills/1
def show
  render json: @bill.as_json
end

# def show
#   amount = @bill.count_amount
  
#   render json: @bill.as_json(
#     include: {
#       age_range_bills: {
#         include: {
#           age_range: { only: [:id, :age_range] }
#         },
#         only: [:amount]
#       },
#       gender_bills: {
#         include: {
#           gender: { only: [:id, :gender] }
#         },
#         only: [:amount]
#       }
#     }
#   ).merge(customer_amount_amount: amount)
# end

  # POST /bills
  def create
    @bill = Bill.new(bill_params)

    if @bill.save
      render json: @bill, status: :created, location: @bill
    else
      render json: @bill.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bills/1
  def update
    if @bill.update(bill_params)
      render json: @bill
    else
      render json: @bill.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bills/1
  def destroy
    @bill.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    # def bill_params
    #   params.expect(bill: [ :doc_no, :doc_date, :total_price, :total_amount, :discount, :get_paid, :change, :member_id, :reservation_id, :status_master_id, :customer_name, :table_id ])
    # end
    def bill_params
      params.require(:bill).permit(
        :doc_no, :doc_date, :total_price, :total_amount, :discount, :get_paid, :change, 
        :member_id, :reservation_id, :status_master_id, :cid,:table_id, :customer_name,
        gender_bills_attributes: [:gender_id, :amount],
        age_range_bills_attributes: [:age_range_id, :amount]
      )
    end
end
