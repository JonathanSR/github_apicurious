class FollowingsController < ApplicationController

  def index
    @followings = Following.find_following_info(current_user)
  end

end