class GithubService
  attr_reader :connection, 
              :client_key_and_secret, 
              :current_user

  def initialize(current_user)
    @current_user = current_user
    @connection = Faraday.new('https://api.github.com/')
    @connection.headers[:Authorization] = "token #{@current_user.token}"
    #byebug
  end

  def user_info 
    parse(connection.get("user"))
  end


  def repos
    parse(connection.get("user/repos")) 
  end
  
  ####count the repo
  def starred_repos
    parse(connection.get("user/starred"))
  end

  def organizations
    parse(connection.get("user/orgs"))
  end    

  def followers
    parse(connection.get("users/#{current_user.username}/followers#{client_key_and_secret}"))
  end

  def users_following
    parse(connection.get("users/#{current_user.username}/followers#{client_key_and_secret}"))    
  end

  def events
    parse(connection.get("users/#{current_user.username}/received_events"))
  end

  def commits
    parse(connection.get("users/#{current_user.username}/events"))
  end

private 
  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end