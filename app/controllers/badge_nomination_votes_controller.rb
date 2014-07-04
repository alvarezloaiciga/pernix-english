class BadgeNominationVotesController < ApplicationController
  def create
    BadgeNominationVote.create(vote_params)
    render 'vote_submitted_success'
  end

  def results
    @badge_nominations = BadgeNomination.this_week.includes(:badge_nomination_votes)
  end

  private
  def vote_params
    params.permit(:badge_nomination_id)
      .merge(params.require(:badge_nomination_vote)
      .permit(:description, :status_id))
  end
end
