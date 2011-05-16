class Response < ActiveRecord::Base
  belongs_to :Evaluation
  belongs_to :Answer
  belongs_to :Question
end
