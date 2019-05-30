class JdntraController < ApplicationController
  before_action only: [:show] do
    data_shaping('jdnno')
  end
  before_action :set_jdntra, only: [:show]
  
  # GET /jdntra
  def index
    if @objects.nil?
      @objects = Jdntra.all.paginate(page: params[:page], per_page: @@row_limit)
    end
    render json: @objects
  end

  # GET /jdntra/1
  def show
    render json: @objects
  end

  # GET /jdntra/filter?
  def filter
    super
    render json: @objects
  end

  def backlog
    public_method(:filter).super_method.call
    render json: @objects.select("nvl(sum(uodsu - jlnurisu), 0) backlog").backlog
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jdntra
      @objects = Jdntra.where(jdnno: params[:id])
    end
    
    # Only allow a trusted parameter "white list" through.
    def jdntra_params
      params.fetch(:jdntra, {})
    end
end
