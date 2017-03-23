class GithubService
  attr_reader :connection, 
              :client_key_and_secret, 
              :current_user

  def initialize(current_user)
    @connection = Faraday.new('https://api.github.com/')
    #byebug
    @current_user = current_user
    #@access_token = access_token
    #byebug
  end

  def client_key_and_secret
   "?client_id=#{ENV["client_id"]}&client_secret=#{ENV["client_secret"]}"
  end

  def user_info 
    parse(connection.get("users/#{current_user.username}#{client_key_and_secret}"))
  end

  def repos
    parse(connection.get("users/#{current_user.username}/repos#{client_key_and_secret}"))
  end
  
  ####count the repo
  def starred_repos
    parse(connection.get("users/#{current_user.username}/starred#{client_key_and_secret}"))
  end

  def organizations
    parse(connection.get("users/#{current_user.username}/orgs#{client_key_and_secret}"))
  end    

  def users_following
    parse(connection.get("users/#{current_user.username}/followers#{client_key_and_secret}"))
  end

  def users_following
    parse(connection.get("users/#{current_user.username}/followers#{client_key_and_secret}"))    
  end

  def recent_commits
    parse(connection.get("users/#{current_user.username}/repos/#{current_user.username}/stats/commit_activity#{client_key_and_secret}"))              
  end


def parse(response)
  JSON.parse(response.body, symbolize_names: true)
end


end