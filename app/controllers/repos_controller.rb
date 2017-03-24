class ReposController < ApplicationController
before_action :authorize!
  
  def index
    @repos = Repo.find_repo_info(current_user)
  end
end

