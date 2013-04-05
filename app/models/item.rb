class Item < ActiveRecord::Base
  attr_accessible :desc, :is_complete, :project_id, :title
  belongs_to :project
  def completed?
     is_complete
   end
end
