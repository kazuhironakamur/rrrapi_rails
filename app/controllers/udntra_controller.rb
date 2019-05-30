class UdntraController < ApplicationController
  before_action only: [:show] do
    data_shaping('udnno')
  end
  before_action :set_udntra, only: [:show, :update, :destroy]

  # GET /udntra
  def index
    @objects = Udntra.all.paginate(page: params[:page], per_page: @@row_limit) if @objects.nil?
    render json: @objects
  end

  # GET /udntra/1
  def show
    render json: @objects
  end

  def filter
    super
    render json: @objects
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_udntra
      @objects = Udntra.where(udnno: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def udntra_params
      params.fetch(:udntra, {})
    end
end
