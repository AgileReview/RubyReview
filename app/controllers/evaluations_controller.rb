class EvaluationsController < ApplicationController
  # GET /evaluations
  # GET /evaluations.xml
  def index
    @evaluations = Evaluation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @evaluations }
    end
  end

  # GET /evaluations/1
  # GET /evaluations/1.xml
  def show
    @evaluation = Evaluation.find(params[:id])
    @responses = Response.find_all_by_Evaluation_id params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @evaluation }
    end
  end

  # GET /evaluations/new
  # GET /evaluations/new.xml
  def new
    @reviewId = params[:review_id]
    @review = Review.find(@reviewId)
    
    @reviewer = TeamMember.find_by_name('Eric Peterson')

    @reviewee_name = @review.TeamMember.name
    @reviewer_name = @reviewer.name

    @evaluation = Evaluation.new
    @evaluation.Review = @review
    @evaluation.TeamMember = @reviewer

    @questions = Question.all
    @answers = @questions.compact.map { |q|
      @r = Response.new
      @r.Evaluation = @evaluation
      @r.Question = q
      @r.Answer = Answer.new

      @r
    }

    @evaluation.answer_set = @answers
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @evaluation }
    end
  end

  # POST /evaluations
  # POST /evaluations.xml
  def create
    @evaluation = Evaluation.new(params[:evaluation])
    @answers = @evaluation.responses

    respond_to do |format|
      if @evaluation.save && @answers.each{|a| a.save }.all?
        format.html { redirect_to(@evaluation, :notice => 'Evaluation was successfully created.') }
        format.xml  { render :xml => @evaluation, :status => :created, :location => @evaluation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @evaluation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluations/1
  # DELETE /evaluations/1.xml
  def destroy
    @evaluation = Evaluation.find(params[:id])
    @evaluation.destroy

    respond_to do |format|
      format.html { redirect_to(evaluations_url) }
      format.xml  { head :ok }
    end
  end
end
