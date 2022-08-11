class BlabsController < ApplicationController
  def index
    @user = User.find_by(handle: params[:handle])
    @blabs = Blab.where(user_id: @user.id).order(created_at: :desc).all
  end

  def show
    @blab = Blab.find(params[:id])
  end

  def new
    @blab = current_user.blabs.build()
  end

  def create
    @blab = current_user.blabs.build(blab_params)

    if @blab.save
      redirect_to user_blabs_url(current_user), notice: "You've blabbed it out there!"
    else
      render "new", status: :unprocessable_entity
    end
  end

  private

  def blab_params
    params.require(:blab).permit(:body)
  end
end
