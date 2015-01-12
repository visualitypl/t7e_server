class ProjectUsersController < ApplicationController
  # TODO: forms would be separated
  def index
    @project_users = ProjectUser.includes(:user).all.uniq
  end

  def new
    @user = User.new
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

  private
  def permitted_params
    params.require(:user).permit(:name, :email)
  end
end
