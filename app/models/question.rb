class Question < ActiveRecord::Base
  validates :questionText, :presence => true,
                           :length => { :minimum => 3 }
end
