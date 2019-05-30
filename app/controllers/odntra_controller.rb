class OdntraController < ApplicationController
  before_action only: [:show] do
    data_shaping('jdnno')
  end
  before_action :set_odntra, only: [:show, :update, :destroy] 

  # GET /odntra
  def index
    @objects = Odntra.all.paginate(page: params[:page], per_page: @@row_limit) if @objects.nil?
    render json: @objects
  end

  # GET /odntra/1
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
    @objects.select("nvl(sum(otpchgsu - urichgsu), 0) * -1")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_odntra
      @objects = Odntra.where(jdnno: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def odntra_params
      params.fetch(:odntra, {})
    end
end
