class CreateOwnersRepos < ActiveRecord::Migration[5.1]
  def change
    create_table :owners_repos do |t|
      t.integer :repo_id
      t.integer :owner_id
    end

    add_index :owners_repos, [:repo_id, :owner_id], unique: true
  end
end
