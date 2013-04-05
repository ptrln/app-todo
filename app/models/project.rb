class Project < ActiveRecord::Base
  attr_accessible :desc, :team_id, :title, :item_ids
  has_many :items
  belongs_to :team
end
