class Review < ActiveRecord::Base
  belongs_to :TeamMember
  validates :dueDate, :presence => true
  validates :TeamMember_id, :presence => true
end
