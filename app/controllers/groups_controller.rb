class GroupsController < ApplicationController
  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.email = "#{@group.slug}@#{ENV['domain']}"
    @group.users << current_user
    @group.create_mailing_list
    @group.add_list_member(current_user)
    if @group.save
      flash[:notice] = "You successfully created a group"
      redirect_to @group
    else
      render :new
    end
  end

  def edit
  end

  def show
    @group = Group.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
  def group_params
    params.require(:group).permit(:name, :description)
  end
end
