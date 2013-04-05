class User < ActiveRecord::Base
  attr_accessible :name
  has_many :team_memberships, foreign_key: "member_id"
  has_many :teams, :through => :team_memberships
end
