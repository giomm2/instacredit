class EmployeesController < ApplicationController
  before_action :find_employee, only: [:show, :destroy, :edit, :update, :history, :report]

  def index
    @employee = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to @employee, notice: "Empleado creado"
    else
      render :new
    end
  end

  def destroy
    if !@employee.time_works.present?
      if @employee.delete
        redirect_to employees_path
      else
        render employees_path
      end
    end
  end

  def edit
  end

  def update
    @employee.update(employee_params)
    if @employee.save
      redirect_to @employee
    else
      render :edit
    end
  end

  def history
  end

  def report
    render pdf: "report"
  end

  private

  def find_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(
      :name,
      :last_name,
      :identification
      )
  end
end
