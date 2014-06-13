class BadgeNominationsController < ApplicationController

  def index
  	@badge_nomination_vote = BadgeNominationVote.new
    @badge_nomination = BadgeNomination.new
  	@nominations = BadgeNomination.this_week
  end

  def create
    BadgeNomination.create(badge_nomination_params)
    render nothing: true
  end

  private

  def badge_nomination_params
    params.require(:badge_nomination).permit(:badge_id, :nominated_id, :nominator_id, :description)
  end
end
