class Evaluation < ActiveRecord::Base
  belongs_to :Review
  belongs_to :TeamMember

  @_answer_set #actually meant to be responses, should really rename this
  @responses

  def answer_set_attributes=(attributes)
    @responses = attributes.map { |a|
      create_response a[1] #just want the data, don't care about the index
    }

    @_answer_set = @responses
  end

  def create_response ans
    @answer = Answer.new
    @answer.answerValue = ans["answer_text"]

    @r = Response.new
    @r.Answer = @answer
    @r.Question = Question.find(ans["question_id"])
    @r.responseDate = DateTime.now
    @r.Evaluation = self

    @r
  end

  def responses
    @responses
  end

  def answer_set= value
    @_answer_set = value
  end
  def answer_set
    @_answer_set
  end
end
