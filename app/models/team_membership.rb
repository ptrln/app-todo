class TeamMembership < ActiveRecord::Base
  attr_accessible :member_id, :team_id
  belongs_to :team
  belongs_to :member, class_name: "User"
end
