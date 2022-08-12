class FeedController < ApplicationController
  before_action :set_current_user, only: %i[index]
  def index
    @blabs = Blab.all_blabs_for_feed(@user)
  end
end
