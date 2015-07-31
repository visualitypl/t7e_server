class ProjectUsersController < ApplicationController
  before_action :load_project_user, only: [:show, :update, :create_project_user]
  # TODO: forms would be separated
  def index
    @project_users = ProjectUser.includes(:user).all.uniq
  end

  def new
    @user = User.new
  end

  def show

  end

  def create
    @user = User.new(permitted_params)

    # create the user
     if @user = User.invite!(email: @user.email, name: @user.name)
      user_type = params[:user][:user_type]

      # assign the user to the projects
      params[:user][:project_ids].each do |project_id|
        next if project_id.blank?
        @user.project_users.build(project_id: project_id, user_type: user_type)
      end
      @user.save!

      redirect_to project_users_path
    else
      render :new
    end
  end

  def create_project_user
    @project_user = ProjectUser.new(permitted_params_for_project_user.merge(user: @project_user.user))
    if @project_user.save
      redirect_to project_user_path(@project_user)
    else
      render 'show'
    end
  end

  private

  def load_project_user
    @project_user = ProjectUser.find(params[:id])
    @user = @project_user.user
  end

  def permitted_params
    params.require(:user).permit(:name, :email)
  end

  def permitted_params_for_project_user
    params.require(:project_user).permit(:project_id, :user_type)
  end
end
