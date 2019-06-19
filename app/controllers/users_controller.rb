class UsersController < ApplicationController
  before_action :set_user, only: [:follow, :unfollow, :edit, :show]

  def index
    @users = User.where.not(id: current_user.id)
  end

  def show
    @tags = Tag.all
  end

  def edit
  end

  def update
    current_user.update(user_params)
    if current_user.save
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def follow
    if current_user.follow(@user.id)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  def unfollow
    if current_user.unfollow(@user.id)
      @followings = Follow.where(follower: current_user)
      @users = User.all
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :username,
      :password,
      :date_of_birth,
      :email,
      :interest_ids,
      :description,
      :avatar
    )
  end
end
