class FeedController < ApplicationController
  def index
    @blabs = Blab.where(user_id: current_user.id).order(created_at: :desc).all
  end
end
