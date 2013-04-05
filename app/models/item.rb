class Item < ActiveRecord::Base
  attr_accessible :desc, :is_complete, :project_id, :title
  belongs_to :project

  validates :title, :project, presence: true

  def completed?
     is_complete
   end
end
