class Commits 
attr_reader :type
            :author,
            :repo,
            :repo_url, 
            :message, 
            :date

  def initialize(events)
    @type     = events[:type]
    @author   = events[:actor][:login]
    @repo     = events[:repo][:name]
    @repo_url = events[:repo][:url] 
    @message  = events[:payload][:ref]
    @date     = events[:created_at]
  end

  def self.find_commit_info(current_user)
    details = GithubService.new(current_user)
    activity = details.events
    new(events)
  end

