require 'spec_helper'
describe EmployeesController, "POST Charge" do
  let(:employee) { double(:employee, id: 1).as_null_object }

  before { allow(Employee).to receive(:find) { employee } }

  it "finds the employee" do
    expect(Employee).to receive(:find).with(employee.id.to_s)
    post :charge, id: employee.id
  end

  it "charges the employee" do
    expect(employee).to receive(:charge!)
    post :charge, id: employee.id
  end

  it "redirects to home page" do
    post :charge, id: employee.id
    expect(response).to redirect_to(root_path)
  end
end
