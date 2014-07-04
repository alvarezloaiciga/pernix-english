require 'spec_helper'

describe EmployeesHelper, "#open_row_tag?" do
  context "when it opens the tag" do
    it { expect(helper.open_row_tag?(8)).to be_true }
  end

  context "when it does not open the tag" do
    it { expect(helper.open_row_tag?(6)).to be_false }
  end
end

describe EmployeesHelper, "#close_row_tag?" do
  context "when it closes the tag" do
    it { expect(helper.close_row_tag?(7)).to be_true }
  end

  context "when it does not close the tag" do
    it { expect(helper.close_row_tag?(8)).to be_false }
  end
end
