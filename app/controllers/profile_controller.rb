class ProfileController < ApplicationController
  before_action :set_current_user, only: %i[edit update]
  before_action :set_user_from_handle, only: %i[index followers following]

  def index
    @blabs = Blab.where(user_id: @user.id).order(created_at: :desc).all
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

  def followers
  end

  def following
  end

  private

  def user_params
    params.require(:user).permit(:bio)
  end
end
