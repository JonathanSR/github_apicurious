class DashboardController < ApplicationController
before_action :authorize!
  
  
  def index
    @user = UserInfo.find_user_info(current_user)
  end

end