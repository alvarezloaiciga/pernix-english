class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :title
      t.integer :points
      t.text :description

      t.timestamps
    end
  end
end
