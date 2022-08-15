class BlabsController < ApplicationController
  before_action :set_current_user, only: %i[new create]
  before_action :set_user_from_handle, only: %i[index]

  def index
    @blabs = Blab.where(user_id: @user.id).order(created_at: :desc).all
  end

  def show
    @blab = Blab.find(params[:id])
  end

  def new
    @blab = @user.blabs.build()
  end

  def create
    @blab = @user.blabs.build(blab_params)

    if @blab.save
      respond_to do |format|
        format.html { redirect_to profile_url(current_user), notice: "You've blabbed it out there!" }
        format.turbo_stream
      end
    else
      render "new", status: :unprocessable_entity
    end
  end

  private

  def blab_params
    params.require(:blab).permit(:body)
  end
end
