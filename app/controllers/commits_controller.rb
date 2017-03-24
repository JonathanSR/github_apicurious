class CommitsController < ApplicationController
  before_action :authorize!

  def index
    @commits = Commit.find_commit_info(current_user)
  end
end