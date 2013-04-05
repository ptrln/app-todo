class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :desc
      t.integer :team_id

      t.timestamps
    end
  end
end
