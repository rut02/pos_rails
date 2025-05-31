class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show update destroy ]

  # GET /products
  def index
    @products = Product.all
    products_with_image_url =@products.map do |product|
      if product.picture.attached?
        product.as_json.merge({ picture_url: url_for(product.picture) })
      
      else
      product.as_json.merge({ picture_url: nil })
      end
    end
    render json: products_with_image_url
  end

  # GET /products/1
  def show
    @product = Product.find(params[:id])
    if @product.picture.attached?
      render json: @product.as_json.merge({ picture_url: url_for(@product.picture) })
    else
      render json: @product.as_json.merge({ picture_url: nil })
    end
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      @product.picture.attach(params[:picture])
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    @product.picture.attach(params[:picture])
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.expect(product: [ :name, :product_category_id, :description, :unit_price ])
    end
end
