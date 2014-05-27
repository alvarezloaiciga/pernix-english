require 'spec_helper'

describe BadgeNomination, "associations" do
  it { should belong_to(:badge) }
  it { should belong_to(:nominated_employee).class_name(Employee) }
  it { should belong_to(:nominator).class_name(Employee) }
end
