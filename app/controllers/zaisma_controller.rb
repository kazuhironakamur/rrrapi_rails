class ZaismaController < ApplicationController
  before_action only: [:show] do
    data_shaping('hincd')
  end
  before_action :set_zaisma, only: [:show, :update, :destroy] 

  # GET /zaisma
  def index
    @objects = Zaisma.all.paginate(page: params[:page], per_page: @@row_limit) if @objects.nil?
    render json: @objects
  end

  # GET /zaisma/1
  def show
    render json: @objects
  end

  def filter
    super
    render json: @objects
  end

  #月次在庫の取得
  def sum
    public_method(:filter).super_method.call
    @objects = @objects.select("nvl(sum(smazaisu), 0)").where(SMADT: Systba.select('monupddt'))
    render json: @objects
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zaisma
      @objects = Zaisma.where(hincd: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def zaisma_params
      params.fetch(:zaisma, {})
    end

end
