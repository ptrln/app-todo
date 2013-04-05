class AddDefaultIsCompleteToProject < ActiveRecord::Migration
  def change
    change_column :items, :is_complete, :boolean, :default => false, :null => false
  end
end
