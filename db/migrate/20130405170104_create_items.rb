class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.text :desc
      t.boolean :is_complete, null: false
      t.integer :project_id, null: false

      t.timestamps
    end
  end
end
