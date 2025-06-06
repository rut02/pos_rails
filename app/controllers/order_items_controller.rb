class OrderItemsController < ApplicationController
  before_action :set_order_item, only: %i[ show update destroy ]

  # GET /order_items
  def index
    @order_items = OrderItem.all

    render json: @order_items
  end

  # GET /order_items/1
  def show
    render json: @order_item
  end

  # GET /order_items/order/:order_id
  def get_order_items_by_order
    @order_items = OrderItem.where(order_id: params[:id])
    render json: @order_items
  end
  # GET /order_items/bill/:bill_id
def get_order_items_by_bill
  @order_items = OrderItem.includes(:product, order: :status_master)
                         .joins(:order)
                         .where(orders: { 
                           bill_id: params[:id],
                           status_master_id: StatusMaster.where(name: 'Served').select(:id)
                         })

  render json: @order_items.as_json(include: {
    product: { only: [:id, :name, :unit_price] },
    order: { only: [:id, :doc_no] }
  })
end

  # POST /order_items
  def create
    @order_item = OrderItem.new(order_item_params)

    if @order_item.save
      render json: @order_item, status: :created, location: @order_item
    else
      render json: @order_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /order_items/1
  def update
    if @order_item.update(order_item_params)
      render json: @order_item
    else
      render json: @order_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /order_items/1
  def destroy
    @order_item.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def order_item_params
      params.expect(order_item: [ :order_id, :product_id, :amount, :unit_price, :price ])
    end
end
