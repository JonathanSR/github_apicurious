class Commit
attr_reader :type,
            :repo,
            :repo_url, 
            :message, 
            :date

  def initialize(activity)
    @type     = activity[:type]
    @repo     = activity[:repo][:name]
    @repo_url = activity[:repo][:url]
    @message  = activity[:payload][:commits]
    @date     = activity[:created_at]
  end

  def self.find_commit_info(current_user)
    details = GithubService.new(current_user)
    activity = details.commits.map do |activity|
    new(activity)
    end
  end
end
