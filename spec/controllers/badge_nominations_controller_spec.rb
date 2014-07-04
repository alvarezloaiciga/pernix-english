require 'spec_helper'

describe BadgeNominationsController, "GET #index" do
  let!(:new_vote) { BadgeNominationVote.new }
  let!(:new_nomination) { BadgeNomination.new }
  let!(:week_nominations) { [] }

  before do
    allow(BadgeNominationVote).to receive(:new) { new_vote }
    allow(BadgeNomination).to receive(:new) { new_nomination }
    allow(BadgeNomination).to receive(:this_week) { week_nominations }
  end

  it "assigns the badge nomination vote" do
    get :index
    expect(assigns(:badge_nomination_vote)).to eq(new_vote)
  end

  it "assigns the badge nomination" do
    get :index
    expect(assigns(:badge_nomination)).to eq(new_nomination)
  end

  it "assigns the week nominations" do
    get :index
    expect(assigns(:nominations)).to eq(week_nominations)
  end

  it "creates the new badge nomination vote" do
    expect(BadgeNominationVote).to receive(:new)
    get :index
  end

  it "creates the new badge nomination" do
    expect(BadgeNomination).to receive(:new)
    get :index
  end

  it "finds the week's nomination" do
    expect(BadgeNomination).to receive(:this_week)
    get :index
  end
end

describe BadgeNominationsController, "POST #create" do
  BADGE_NOMINATION_PARAMS = {
    badge_id: "1",
    nominated_id: "1",
    nominator_id: "1",
    description: 'DESCRIPTION'
  }.with_indifferent_access

  let!(:nomination) { BadgeNomination.create(BADGE_NOMINATION_PARAMS) }
  let!(:new_vote) { BadgeNominationVote.new }

  before do
    allow(BadgeNomination).to receive(:create) { nomination }
    allow(BadgeNominationVote).to receive(:new) { new_vote }
  end

  it "creates the nomination" do
    expect(BadgeNomination).to receive(:create).with(BADGE_NOMINATION_PARAMS) { true }
    xhr :post, :create, badge_nomination: BADGE_NOMINATION_PARAMS
  end

  it "assigns the nomination" do
    xhr :post, :create, badge_nomination: BADGE_NOMINATION_PARAMS
    expect(assigns(:nomination)).to eq(nomination)
  end

  context "when nomination is saved" do
    it "assigns the badge nomination vote" do
      xhr :post, :create, badge_nomination: BADGE_NOMINATION_PARAMS
      expect(assigns(:badge_nomination_vote)).to eq(new_vote)
    end

    it "creates a new nomination vote" do
      expect(BadgeNominationVote).to receive(:new)
      xhr :post, :create, badge_nomination: BADGE_NOMINATION_PARAMS
    end

    it "renders create_nomination_success" do
      pending
    end
  end

  context "when nomination is not saved" do
    before { allow(BadgeNomination).to receive(:create) { nil } }
    it "renders create_nomination_fail" do
      pending
    end
  end
end
