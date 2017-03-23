class DashboardController < ApplicationController
  
  
  def index
  UserInfo.find_user_info(current_user)
  @name = current_user[:name]
  @followers = current_user[:followers]
  @following = current_user[:following]
  @repo = current_user[:public_repos]
  end

end