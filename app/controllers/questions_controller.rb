class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    
    respond_to do |format|
      format.html #index.html.erb
      format.xml {render :xml => @questions}
    end
  end
  
  def show
    @question = Question.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @question }
    end
  end
  
  def new
    @question = Question.new
    
    respond_to do |format|
      format.html # new.html.erb
    end
  end
  
  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(params[:question])

    respond_to do |format|
      if @question.save
        format.html { redirect_to(@question, :notice => 'Question was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to(@question, :notice => 'Question was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to(questions_url) }
    end
  end
end