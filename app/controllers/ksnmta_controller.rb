class KsnmtaController < ApplicationController
  before_action :set_ksnmta, only: [:show, :update, :destroy]

  # GET /ksnmta
  def index
    @ksnmta = Ksnmta.all

    render json: @ksnmta
  end

  # GET /ksnmta/1
  def show
    render json: @ksnmta
  end

  # POST /ksnmta
  def create
    @ksnmta = Ksnmta.new(ksnmta_params)

    if @ksnmta.save
      render json: @ksnmta, status: :created, location: @ksnmta
    else
      render json: @ksnmta.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ksnmta/1
  def update
    if @ksnmta.update(ksnmta_params)
      render json: @ksnmta
    else
      render json: @ksnmta.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ksnmta/1
  def destroy
    @ksnmta.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ksnmta
      @ksnmta = Ksnmta.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ksnmta_params
      params.fetch(:ksnmta, {})
    end
end
