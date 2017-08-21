class CreateRepos < ActiveRecord::Migration[5.1]
  def change
    create_table :repos do |t|
      t.string :name

      t.timestamps
    end

    add_index :repos, :name, unique: true
  end
end
