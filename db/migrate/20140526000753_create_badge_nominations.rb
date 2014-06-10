class CreateBadgeNominations < ActiveRecord::Migration
  def change
    create_table :badge_nominations do |t|
      t.references :badge, index: true
      t.integer :nominated_id
      t.integer :nominator_id
      t.text :description

      t.timestamps
    end
  end
end
