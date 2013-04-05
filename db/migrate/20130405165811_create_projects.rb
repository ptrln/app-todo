class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.text :desc
      t.integer :team_id, null: false

      t.timestamps
    end
  end
end
