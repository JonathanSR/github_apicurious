class CommitsController < ApplicationController

  def index
    @commits = Commit.find_commit_info(current_user)
  end
end