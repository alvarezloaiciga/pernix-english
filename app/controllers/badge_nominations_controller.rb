class BadgeNominationsController < ApplicationController

  def index
  	@badge_nomination_vote = BadgeNominationVote.new
  	@nominations = BadgeNomination.all
  end
end
