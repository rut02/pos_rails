class TablesController < ApplicationController
  before_action :set_table, only: %i[ show update destroy ]

  # GET /tables
  def index
    @tables = Table.all
    Table.check_reservation
    
    # p s_name
    tables_with_status_name =@tables.map do |table|
      s_name = Table.getStatusMaster(table.status_master_id)
      table.as_json.merge({ status_name: s_name })
      
    end
   
    
   

    render json: tables_with_status_name
  end

  # GET /tables/1
  def show
    render json: @table
  end
  def get_available_tables
    @tables = Table.where(status_master_id: StatusMaster::AVAILABLE)
    render json: @tables
  end

  # POST /tables
  def create
    @table = Table.new(table_params)

    if @table.save
      render json: @table, status: :created, location: @table
    else
      render json: @table.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tables/1
  def update
    if @table.update(table_params)
      render json: @table
    else
      render json: @table.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tables/1
  def destroy
    @table.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table
      @table = Table.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def table_params
      params.expect(table: [ :name, :capacity, :status_master_id ])
    end
end
