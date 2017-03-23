class CommitsController < ApplicationController

  def index
    #byebug
    @commits = Commit.find_commit_info(current_user, repo)
  end
end