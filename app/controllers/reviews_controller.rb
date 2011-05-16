class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    
    respond_to do |format|
      format.html #index.html.erb
    end
  end
  
  def new
    @review = Review.new
    @teamMembers = TeamMember.all.map { |teamMember| [teamMember.name, teamMember.id] }

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @review = Review.new(params[:review])

    respond_to do |format|
      if @review.save
        format.html { redirect_to reviews_path }
      else
        @teamMembers = TeamMember.all.map { |teamMember| [teamMember.name, teamMember.id] }
        format.html { render :action => "new" }
      end
    end
  end
end