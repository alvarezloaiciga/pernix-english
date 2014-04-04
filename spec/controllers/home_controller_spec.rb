require 'spec_helper'
describe HomeController, "GET index" do
  it "gets all the employees" do
    expect(Employee).to receive(:all)
    get :index
  end

  it "assigns employees" do
    employees = [double(:employee)]
    allow(Employee).to receive(:all) { employees }

    get :index

    expect(assigns[:employees]).to eq employees
  end

  it "renders the index template" do
    get :index
    expect(response).to render_template(:index)
  end
end
