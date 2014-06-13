require 'spec_helper'

describe Employee, "associations" do
  it { should have_many(:charges) }
  it { should have_many(:nominations).class_name(BadgeNomination) }
end

describe Employee, "#charge!" do
  before do
    ChargeMailer.stub_chain(:employee_charged, :deliver) { true }
  end

  context "when was charged less than 2 minute ago" do
    subject(:employee) { described_class.create(last_charged_at: Time.now) }

    it "does not get the charge" do
      employee.charge!(100)
      expect(employee.total).to eq 0
    end
  end

  context "when was charged more than 2 minute ago" do
    subject!(:employee) { described_class.create(last_charged_at: Time.now - 5.minutes) }

    it "creates the charge" do
      expect(employee.charges).to receive(:create).with(ammount: 100)
      employee.charge!(100)
    end

    it "updates the total" do
      employee.charge!(100)
      expect(employee.total).to eq 100
    end

    it "updates charged_at" do
      time = Time.now
      allow(Time).to receive(:now) { time }

      employee.charge!(100)

      expect(employee.last_charged_at).to eq time
    end

    it "sends the mail" do
      mail = double(:mail)
      expect(ChargeMailer).to receive(:employee_charged).with(employee, 100) { mail }
      expect(mail).to receive(:deliver)
      employee.charge!(100)
    end
  end
end
