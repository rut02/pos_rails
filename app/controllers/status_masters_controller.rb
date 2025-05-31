class StatusMastersController < ApplicationController
  before_action :set_status_master, only: %i[ show update destroy ]

  # GET /status_masters
  def index
    @status_masters = StatusMaster.all

    render json: @status_masters
  end

  # GET /status_masters/1
  def show
    render json: @status_master
  end

  # POST /status_masters
  def create
    @status_master = StatusMaster.new(status_master_params)

    if @status_master.save
      render json: @status_master, status: :created, location: @status_master
    else
      render json: @status_master.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /status_masters/1
  def update
    if @status_master.update(status_master_params)
      render json: @status_master
    else
      render json: @status_master.errors, status: :unprocessable_entity
    end
  end

  # DELETE /status_masters/1
  def destroy
    @status_master.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status_master
      @status_master = StatusMaster.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def status_master_params
      params.expect(status_master: [ :name ])
    end
end
