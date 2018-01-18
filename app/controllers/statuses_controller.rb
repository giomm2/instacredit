class StatusesController < ApplicationController
  before_action :find_status, only: [:show, :destroy, :edit, :update]

  def index
    @status = Status.all
  end

  def new
    @status = Status.new
  end

  def create
    @status = Status.new(status_params)
    if @status.save
      redirect_to @status, notice: "Estado creado"
    else
      render :new
    end
  end

  def destroy
    if !@status.time_works.present?
      if @status.delete
        redirect_to statuses_path
      else
        render statuses_path
      end
    end
  end

  def edit
  end

  def update
    @status.update(status_params)
    if @status.save
      redirect_to @status
    else
      render :edit
    end
  end

  private

  def find_status
    @status = Status.find(params[:id])
  end

  def status_params
    params.require(:status).permit(
      :name
      )
  end
end
