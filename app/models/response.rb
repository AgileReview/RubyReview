class Response < ActiveRecord::Base
  belongs_to :Evaluation
  belongs_to :Answer
  belongs_to :Question

  @_answer_text
  def answer_text= value
    @_answer_text = value
  end
  def answer_text
    @_answer_text
  end

  def question_id
    self.Question.id #need self, otherwise it thinks I'm going for a class method
  end
end
