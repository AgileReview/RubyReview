class Review < ActiveRecord::Base
  belongs_to :TeamMember
  validates :dueDate, :presence => true
  validates :TeamMember, :presence => true
end
