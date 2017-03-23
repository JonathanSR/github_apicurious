class ReposController < ApplicationController
  
  def index
    @repos = Repo.find_repo_info(current_user)
  end
end

