class BadgeNominationsController < ApplicationController

  def index
  	@badge_nomination_vote = BadgeNominationVote.new
    @badge_nomination = BadgeNomination.new
  	@nominations = BadgeNomination.this_week
  end

  def create
    if @nomination = BadgeNomination.create(badge_nomination_params)
      @badge_nomination_vote = BadgeNominationVote.new
      render 'create_nomination_success'
    else
      render 'create_nomination_fail'
    end
  end

  private

  def badge_nomination_params
    params.require(:badge_nomination).permit(:badge_id, :nominated_id, :nominator_id, :description)
  end
end
