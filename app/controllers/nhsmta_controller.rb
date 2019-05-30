class NhsmtaController < ApplicationController
  before_action :set_nhsmta, only: [:show, :update, :destroy]

  # GET /nhsmta
  def index
    @nhsmta = Nhsmta.all

    render json: @nhsmta
  end

  # GET /nhsmta/1
  def show
    render json: @nhsmta
  end

  # POST /nhsmta
  def create
    @nhsmta = Nhsmta.new(nhsmta_params)

    if @nhsmta.save
      render json: @nhsmta, status: :created, location: @nhsmta
    else
      render json: @nhsmta.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /nhsmta/1
  def update
    if @nhsmta.update(nhsmta_params)
      render json: @nhsmta
    else
      render json: @nhsmta.errors, status: :unprocessable_entity
    end
  end

  # DELETE /nhsmta/1
  def destroy
    @nhsmta.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nhsmta
      @nhsmta = Nhsmta.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def nhsmta_params
      params.fetch(:nhsmta, {})
    end
end
