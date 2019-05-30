class SystbaController < ApplicationController
  before_action only: [:show] do
    data_shaping('comcd')
  end
  before_action :set_systba, only: [:show, :update, :destroy] 

  # GET /systba
  def index
    @objects = Systba.all.paginate(page: params[:page], per_page: @@row_limit) if @objects.nil?
    render json: @objects
  end

  # GET /systba/1
  def show
    render json: @objects
  end

  def filter
    super
    render json: @objects
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_systba
      @objects = Systba.where(jdnno: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def systba_params
      params.fetch(:systba, {})
    end

end
