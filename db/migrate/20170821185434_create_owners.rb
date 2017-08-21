class CreateOwners < ActiveRecord::Migration[5.1]
  def change
    create_table :owners do |t|
      t.string :name

      t.timestamps
    end

    add_index :owners, :name, unique: true
  end
end
