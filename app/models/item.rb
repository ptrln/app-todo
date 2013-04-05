class Item < ActiveRecord::Base
  attr_accessible :desc, :is_complete, :project_id, :title
end
