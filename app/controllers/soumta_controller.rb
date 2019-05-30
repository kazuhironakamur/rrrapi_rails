class SoumtaController < ApplicationController
  before_action only: [:show] do
    data_shaping('soucd')
  end
  before_action :set_soumta, only: [:show, :update, :destroy]

  # GET /soumta
  def index
    @objects = Soumta.all.paginate(page: params[:page], per_page: @@row_limit) if @objects.nil?
    render json: @objects
  end

  # GET /soumta/1
  def show
    render json: @objects
  end

  def filter
    super
    render json: @objects
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_soumta
      @soumta = Soumta.where(soucd: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def soumta_params
      params.fetch(:soumta, {})
    end
end
