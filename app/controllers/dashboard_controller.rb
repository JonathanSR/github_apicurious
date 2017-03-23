class DashboardController < ApplicationController
  
  
  def index
    @user = UserInfo.find_user_info(current_user)
  end

end