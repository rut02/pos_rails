class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show update destroy ]

  # GET /orders
  def index
    @orders = Order.all

    render json: @orders.as_json
  end

  # GET /orders/1
  def show
    render json: @order.as_json
  end

  # POST /orders
  def create
    @order = Order.new(order_params)

    if @order.save
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    # def order_params
    #   params.expect(order: [ :bill_id, :doc_no, :doc_date, :total_price, :total_amount, :staff_id, :status_master_id ])
    # end
    def order_params
      params.require(:order).permit(
        :bill_id, :doc_no, :doc_date, :total_price, :total_amount, :staff_id, :status_master_id,
        order_items_attributes: [:product_id, :amount]
      )
    end
end
