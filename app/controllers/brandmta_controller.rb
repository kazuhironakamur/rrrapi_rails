class BrandmtaController < ClsmtaController
  before_action only: [:show] do
    data_shaping('clsid')
  end
  before_action :set_brandmta, only: [:show, :update, :destroy]

  # GET /brandmta
  def index
    @objects = Brandmta.all.paginate(page: params[:page], per_page: @@row_limit) if @objects.nil?
    render json: @objects
  end

  # GET /brandmta/1
  def show
    render json: @objects
  end

  def filter
    super
    render json: @objects
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brandmta
      @objects = Brandmta.where(clsid: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def brandmta_params
      params.fetch(:brandmta, {})
    end
end
