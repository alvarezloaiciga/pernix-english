class CreateEmployee < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.float :total, default: 0.0
      t.datetime :last_charged_at
      t.timestamps
    end
  end
end
