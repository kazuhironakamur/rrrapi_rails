class ZaitraController < ApplicationController
  before_action only: [:show] do
    data_shaping('denno')
  end
  before_action :set_zaitra, only: [:show, :update, :destroy] 

  # GET /zaitra
  def index
    @objects = Zaitra.all.paginate(page: params[:page], per_page: @@row_limit) if @objects.nil?
    render json: @objects
  end

  # GET /zaitra/1
  def show
    render json: @objects
  end

  def filter
    super
    render json: @objects
  end

  # 在庫受払トラン(入荷分）集計
  def import_sum
    public_method(:filter).super_method.call
    @objects = @objects.import.select("nvl(sum(movsu), 0)")
    render json: @objects
  end

  # 在庫受払トラン(出荷分）集計
  def export_sum
    public_method(:filter).super_method.call
    @objects.export.select("nvl(sum(movsu) * -1, 0)")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zaitra
      @objects = Zaitra.where(jdnno: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def zaitra_params
      params.fetch(:zaitra, {})
    end

end
