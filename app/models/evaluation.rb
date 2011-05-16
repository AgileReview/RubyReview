class Evaluation < ActiveRecord::Base
  belongs_to :Review
  belongs_to :TeamMember
end
