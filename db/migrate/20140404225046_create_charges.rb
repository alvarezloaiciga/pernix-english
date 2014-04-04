class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.float :ammount
      t.references :employee

      t.timestamps
    end

    add_index :charges, :employee_id
  end
end
