class CreateBadgeNominationVotes < ActiveRecord::Migration
  def change
    create_table :badge_nomination_votes do |t|
      t.references :badge_nomination, index: true
      t.references :status, index: true
      t.text :description

      t.timestamps
    end
  end
end
