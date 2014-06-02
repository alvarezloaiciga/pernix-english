class BadgeNominationVotesController < ApplicationController
  def create
    @badge_nomination_vote = BadgeNominationVote.new(vote_params)
    @badge_nomination_vote.save
  end

  private
  def vote_params
    params.require(:badge_nomination_vote).permit(:description, :status)
  end
end