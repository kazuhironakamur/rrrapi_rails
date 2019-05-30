class TokmtaController < ApplicationController
  before_action :set_tokmta, only: [:show, :update, :destroy]

  # GET /tokmta
  def index
    @objects = Tokmta.all

    render json: @objects
  end

  # GET /tokmta/1
  def show
    render json: @objects
  end

  def filter
    super
    render json: @objects
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tokmta
      @tokmta = Tokmta.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tokmta_params
      params.fetch(:tokmta, {})
    end
end
