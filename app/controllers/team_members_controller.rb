class TeamMembersController < ApplicationController
  # GET /team_members
  def index
    @team_members = TeamMember.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /team_members/1
  def show
    @team_member = TeamMember.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /team_members/new
  def new
    @team_member = TeamMember.new
    @roles = Role.all.map { |role| [role.name, role.id] }

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /team_members/1/edit
  def edit
    @team_member = TeamMember.find(params[:id])
  end

  # POST /team_members
  def create
    @team_member = TeamMember.new(params[:team_member])

    respond_to do |format|
      if @team_member.save
        format.html { redirect_to(@team_member, :notice => 'Team member was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /team_members/1
  def update
    @team_member = TeamMember.find(params[:id])

    respond_to do |format|
      if @team_member.update_attributes(params[:team_member])
        format.html { redirect_to(@team_member, :notice => 'Team member was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /team_members/1
  def destroy
    @team_member = TeamMember.find(params[:id])
    @team_member.destroy

    respond_to do |format|
      format.html { redirect_to(team_members_url) }
    end
  end
end
