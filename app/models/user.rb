class User < ActiveRecord::Base
  attr_accessible :name, :team_ids
  has_many :team_memberships, foreign_key: "member_id"
  has_many :teams, :through => :team_memberships
  has_many :projects, :through => :teams

  validates :name, presence: true
end
