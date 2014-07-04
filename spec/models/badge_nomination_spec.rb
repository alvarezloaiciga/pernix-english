require 'spec_helper'

describe BadgeNomination, "associations" do
  it { should belong_to(:badge) }
  it { should belong_to(:nominated_employee).class_name(Employee) }
  it { should belong_to(:nominator).class_name(Employee) }
end

describe BadgeNomination, "#count_votes_with_status" do
  let!(:accepted_status) { Status.create(status: 'Accept') }
  let!(:denied_status) { Status.create(status: 'Deny') }
  let!(:nomination) { BadgeNomination.create() }
  let!(:nomination_accepted) { BadgeNominationVote.create(badge_nomination: nomination, status: accepted_status) }
  let!(:other_nomination_accepted) { BadgeNominationVote.create(badge_nomination: nomination, status: accepted_status) }
  let!(:nomination_denied) { BadgeNominationVote.create(badge_nomination: nomination, status: denied_status) }

  it "gets only the nominations with the desire status" do
    expect(nomination.count_votes_with_status('Accept')).to eq(2)
  end
end
