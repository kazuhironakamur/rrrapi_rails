class HsttraController < ApplicationController
  before_action only: [:show] do
    data_shaping('hincd')
  end

  before_action :set_hsttra, only: [:show, :update, :destroy]

  # GET /hsttra
  def index
    @objects = Hsttra.all.paginate(page: params[:page], per_page: @@row_limit) if @objects.nil?
    render json: @objects
  end

  # GET /hsttra/1
  def show
    render json: @objects
  end
  
  def filter
    super
    render json: @objects
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hsttra
      @objects = Hsttra.where(hincd: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hsttra_params
      params.fetch(:hsttra, {})
    end
end
