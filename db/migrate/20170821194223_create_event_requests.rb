class CreateEventRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :event_requests do |t|
      t.integer :owner_id
      t.integer :repo_id
      t.integer :event_type_id

      t.timestamps
    end

    add_index :event_requests, [:owner_id, :repo_id, :event_type_id], unique: true
    add_index :event_requests, :owner_id
    add_index :event_requests, :repo_id
  end
end
