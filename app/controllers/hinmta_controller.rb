require 'nkf'

class HinmtaController < ApplicationController
  before_action only: [:show] do
    data_shaping('hincd')
  end
  before_action :set_hinmta, only: [:show]
  
  # GET /hinmta
  def index
    if @objects.nil?
      @objects = Hinmta.all.paginate(page: params[:page], per_page: @@row_limit).
      joins(:hinjancd).
      joins(:brandmta).
      list.
      select('hinjancd.jsjancd, clsmta.clsnm')
    end
    render json: @objects
  end

  # GET /hinmta/1
  def show
    render json: @objects
  end

  # GET /hinmta/filter?
  def filter
    if @objects.nil?
      @objects = Hinmta.all.paginate(page: params[:page], per_page: @@row_limit).
      joins(:hinjancd).
      joins(:brandmta).
      list.
      select('hinjancd.jsjancd, clsmta.clsnm')
    end
    
    super(%w(hinnma hinnmb))

    # 品名での検索
    unless @qp[:hinnma].blank?
      @qp[:hinnma].strip.gsub('　', ' ').split(' ').each{|n|
        full_n = NKF.nkf("-w", n) # 半角カナ -> 全角カナ 
        hulf_n = NKF.nkf("-wx -Z4", n) # 全角カナ -> 半角カナ
        @objects = @objects.where("hinnma like ?", '%' + full_n + '%')
          .or(@objects.where("hinnma like ?", '%' + hulf_n + '%'))
      }
      @qp.delete(:hinnma)
    end

    # 規格での検索
    unless @qp[:hinnmb].blank?
      @qp[:hinnmb].strip.gsub('　', ' ').split(' ').each{|n|
        full_n = NKF.nkf("-w", n) # 半角カナ -> 全角カナ 
        hulf_n = NKF.nkf("-wx -Z4", n) # 全角カナ -> 半角カナ
        @objects = @objects.where("hinnmb like ?", '%' + full_n + '%')
          .or(@objects.where("hinnmb like ?", '%' + hulf_n + '%'))
      }
      @qp.delete(:hinnmb)
    end

    render json: @objects
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hinmta
      @objects = Hinmta.where(hincd: params[:id]).joins(:brandmta).
        select('hinmta.*, clsmta.clsnm')
    end
    
    # Only allow a trusted parameter "white list" through.
    def hinmta_params
      params.fetch(:hinmta, {})
    end
end
