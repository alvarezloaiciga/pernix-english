class EmployeesController < ApplicationController
  def charge
    employee = Employee.find(params[:id])
    employee.charge
    redirect_to root_path
  end
end
