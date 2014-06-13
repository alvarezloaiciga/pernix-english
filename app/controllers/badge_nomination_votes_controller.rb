class BadgeNominationVotesController < ApplicationController
  def create
    BadgeNominationVote.create(vote_params)
    render nothing: true
  end

  private
  def vote_params
    params.permit(:badge_nomination_id)
      .merge(params.require(:badge_nomination_vote)
      .permit(:description, :status_id))
  end
end
