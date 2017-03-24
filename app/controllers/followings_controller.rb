class FollowingsController < ApplicationController
before_action :authorize!

  def index
    @followings = Following.find_following_info(current_user)
  end

end