class ClsmtaController < ApplicationController
  before_action only: [:show] do
    data_shaping('clsid')
  end
  before_action :set_clsmta, only: [:show, :update, :destroy]

  # GET /clsmta
  def index
    @objects = Clsmta.all.paginate(page: params[:page], per_page: @@row_limit) if @objects.nil?
    render json: @objects
  end

  # GET /clsmta/1
  def show
    render json: @objects
  end

  def filter
    super
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clsmta
      @objects = Clsmta.where(clsid: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def clsmta_params
      params.fetch(:clsmta, {})
    end
end
