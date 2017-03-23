class Following
attr_reader :type,
            :author,
            :repo,
            :repo_url, 
            :message, 
            :date

  def initialize(activity)
    @type     = activity[:type]
    @author   = activity[:actor][:login]
    @repo     = activity[:repo][:name]
    @repo_url = activity[:repo][:url] 
    @message  = activity[:payload][:ref]
    @date     = activity[:created_at]
  end

  def self.find_following_info(current_user)
    details = GithubService.new(current_user)
    #byebug
    activities = details.events.map do |activity|
    new(activity)
    end
  end
end