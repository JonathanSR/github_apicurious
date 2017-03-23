class Repo
attr_reader :name,
            :forks,
            :forked,
            :language,
            :fork_count,
            :updated_at,
            :status

  def initialize(repo)
    @name       = repo[:name]
    @forked     = repo[:fork]
    @forks      = repo[:fork_count].to_i
    @language   = repo[:language]
    @fork_count = repo[:fork_count]
    @updated_at = repo[:updated_at]
    @status     = repo[:private]
  end


  def self.find_repo_info(current_user)
    details = GithubService.new(current_user)
    repositories = details.repos.map do |repo|
    new(repo)
    end
  end
end