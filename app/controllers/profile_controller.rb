class ProfileController < ApplicationController
  before_action :set_current_user, only: %i[edit update]
  before_action :set_user_from_handle, only: %i[index followers following follow unfollow]

  def index
    @blabs = Blab.where(user_id: @user.id).order(created_at: :desc).page params[:page]
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to settings_path, notice: "Your settings have been saved"
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def follow
    @user.add_follower(current_user)

    if @user.save
      redirect_to profile_path(@user), notice: "You followed this user!"
    else
      render "index", status: :unprocessable_entity, warning: "Couldn't follow this user"
    end
  end

  def unfollow
    @user.remove_follower(current_user)

    if @user.save
      redirect_to profile_path(@user), notice: "You unfollowed this user!"
    else
      render "index", status: :unprocessable_entity, warning: "Couldn't unfollow this user"
    end
  end

  def followers
    @followers = @user.followers.page(params[:page])
  end

  def following
    @followees = @user.followees.page(params[:page])
  end

  private

  def user_params
    params.require(:user).permit(:bio, :display_name)
  end
end
