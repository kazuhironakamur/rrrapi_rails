class ItemstatusmtaController < ClsmtaController
  before_action only: [:show] do
    data_shaping('clsid')
  end
  before_action :set_itemstatusmta, only: [:show, :update, :destroy]

  # GET /itemstatusmta
  def index
    @objects = Itemstatusmta.all.paginate(page: params[:page], per_page: @@row_limit) if @objects.nil?
    render json: @objects
  end

  # GET /itemstatusmta/1
  def show
    render json: @objects
  end

  def filter
    super
    render json: @objects
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itemstatusmta
      @objects = Itemstatusmta.where(clsid: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def itemstatusmta_params
      params.fetch(:itemstatusmta, {})
    end
end
