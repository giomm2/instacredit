class TimeWorksController < ApplicationController
  before_action :find_time, only: [:show]

  def index
    @employee = Employee.all
  end

  def new
    @employee = Employee.all
    @location = Location.all
    @status = Status.all
    @time = TimeWork.new
  end

  def create
    @time = TimeWork.new(time_params)
    if @time.save
      redirect_to @time, notice: "creado"
    else
      @employee = Employee.all
      @location = Location.all
      @status = Status.all
      render :new
    end
  end

  def show
  end

  private

  def find_time
    @time = TimeWork.find(params[:id])
  end

  def time_params
    params.require(:time_work).permit(
      :status_id,
      :employee_id,
      :location_id,
      :finish_date,
      :start_date
    )
  end
end
