class LocationsController < ApplicationController
  before_action :find_location, only: [:show, :destroy, :edit, :update]

  def index
    @location = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to @location, notice: "Ubicacion creada"
    else
      render :new
    end
  end

  def destroy
    if !@location.time_works.present?
      if @location.delete
        redirect_to locations_path
      else
        render locations_path
      end
    end
  end

  def edit
  end

  def update
    @location.update(location_params)
    if @location.save
      redirect_to @location
    else
      render :edit
    end
  end

  private

  def find_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(
      :name
      )
  end
end
