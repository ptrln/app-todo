class Project < ActiveRecord::Base
  attr_accessible :desc, :team_id, :title, :item_ids
  has_many :items
  belongs_to :team

  validates :team, :title, presence: true

  def completed?
    items.all?(&:completed?)
  end
end
