require 'spec_helper'

describe BadgeNominationVotesController, "POST #create" do
  BADGE_NOMINATION_VOTE_PARAMS = { badge_nomination_vote: { description: 'DESCRIPTION', status_id: '1' }.with_indifferent_access }
  BADGE_NOMINATION_PARAMS = { badge_nomination_id: '1' }.with_indifferent_access

  it "saves the vote" do
    expect(BadgeNominationVote).to receive(:create).with(BADGE_NOMINATION_PARAMS.merge(BADGE_NOMINATION_VOTE_PARAMS[:badge_nomination_vote]))
    xhr :post, :create, BADGE_NOMINATION_PARAMS.merge(BADGE_NOMINATION_VOTE_PARAMS)
  end

  it "renders vote_sumitted_success" do
    pending
  end
end

describe BadgeNominationVotesController, "GET #results" do
  let(:this_week_nominations) { double(:this_week_nominations) }

  before { BadgeNomination.stub_chain(:this_week, :includes) { this_week_nominations } }

  it "assigns @badge_nominations" do
    get :results
    expect(assigns(:badge_nominations)).to eq(this_week_nominations)
  end
end
