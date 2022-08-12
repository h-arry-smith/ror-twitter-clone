class ProfileController < ApplicationController
  def index
    @user = User.find_by(handle: params[:handle])
    @blabs = Blab.where(user_id: @user.id).order(created_at: :desc).all
  end
  
  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to settings_path, notice: "Your settings have been saved"
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def followers
    @user = User.find_by(handle: params[:handle])
  end

  def following
    @user = User.find_by(handle: params[:handle])
  end

  private

  def user_params
    params.require(:user).permit(:bio)
  end
end
