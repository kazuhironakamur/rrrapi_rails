class JdntrbController < ApplicationController
  before_action only: [:show] do
    data_shaping('jdnno')
  end
  before_action :set_jdntrb, only: [:show, :update, :destroy] 

  # GET /jdntrb
  def index
    @objects = Jdntrb.all.paginate(page: params[:page], per_page: @@row_limit) if @objects.nil?
    render json: @objects
  end

  # GET /jdntrb/1
  def show
    render json: @objects
  end

  def filter
    super
    render json: @objects
  end

  #出荷予定トラン集計
  def sum
    public_method(:filter).super_method.call
    @objects.select("nvl(sum(sytsu - jlnotpsu), 0)")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jdntrb
      @objects = Jdntrb.where(jdnno: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def jdntrb_params
      params.fetch(:jdntrb, {})
    end
end
