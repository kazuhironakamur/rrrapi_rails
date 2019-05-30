class HinjancdController < ApplicationController
  before_action only: [:show] do
    data_shaping('hincd')
  end
  before_action :set_hinjancd, only: [:show]

  # GET /hinjancd
  def index
    @objects = Hinjancd.all.paginate(page: params[:page], per_page: @@row_limit) if @objects.nil?
    render json: @objects
  end

  # GET /hinjancd/1
  def show
    render json: @objects
  end

  # GET /hinjancd/filter?
  def filter
    super(%w(jsjancd))

    # 規格での検索
    unless @qp[:jsjancd].blank?
      @qp[:jsjancd].strip.gsub('　', ' ').split(' ').each{|n|
        full_n = NKF.nkf("-w", n) # 半角カナ -> 全角カナ 
        hulf_n = NKF.nkf("-wx -Z4", n) # 全角カナ -> 半角カナ
        @objects = @objects.where("jsjancd like ?", '%' + full_n + '%')
          .or(@objects.where("jsjancd like ?", '%' + hulf_n + '%'))
      }
      @qp.delete(:jsjancd)
    end

    render json: @objects
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hinjancd
      @objects = Hinjancd.where(hincd: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hinjancd_params
      params.fetch(:hinjancd, {})
    end
end
