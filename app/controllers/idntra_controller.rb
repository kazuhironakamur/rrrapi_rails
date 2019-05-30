class IdntraController < ApplicationController
  before_action only: [:show] do
    data_shaping('hincd')
  end
  before_action :set_idntra, only: [:show, :update, :destroy] 

  # GET /idntra
  def index
    @objects = Idntra.all.paginate(page: params[:page], per_page: @@row_limit) if @objects.nil?
    render json: @objects
  end

  # GET /idntra/1
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
    @objects.select("nvl(sum(inpchgsu - srechgsu), 0)")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idntra
      @objects = Idntra.where(hincd: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def idntra_params
      params.fetch(:idntra, {})
    end

end
