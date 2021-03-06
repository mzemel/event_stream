class CreateEventTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :event_types do |t|
      t.string :name

      t.timestamps
    end

    add_index :event_types, :name, unique: true
  end
end
