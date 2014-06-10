require 'spec_helper'

describe BadgeNominationVote, "associations" do
  it { should belong_to(:badge_nomination) }
  it { should belong_to(:status) }
end
