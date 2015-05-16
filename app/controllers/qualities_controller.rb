class QualitiesController < ApplicationController
  before_action :set_quality, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @qualities = Quality.all
    respond_with(@qualities)
  end

  def show
    respond_with(@quality)
  end

  def new
    @quality = Quality.new
    respond_with(@quality)
  end

  def edit
  end

  def create
    @quality = Quality.new(quality_params)
    @quality.save
    respond_with(@quality)
  end

  def update
    @quality.update(quality_params)
    respond_with(@quality)
  end

  def destroy
    @quality.destroy
    respond_with(@quality)
  end

  private
    def set_quality
      @quality = Quality.find(params[:id])
    end

    def quality_params
      params.require(:quality).permit(:name)
    end
end
