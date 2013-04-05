class Team < ActiveRecord::Base
  attr_accessible :name, :member_ids
  has_many :team_memberships
  has_many :members, :through => :team_memberships
  has_many :projects

  validates :name, presence: true
end
