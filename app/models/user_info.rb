class UserInfo 
 attr_reader :name,
             :followers,
             :following,
             :repo

def initialize(user_information)
  @name = user_info[:name]
  byebug
  @followers = user_info[:followers]
  @following = user_info[:following]
  @repo = user_details[:public_repos]
  byebug
end

def self.find_user_info(current_user)
  #byebug
    details = GithubService.new(current_user)
    user_information = details.user_info
    # user_information = details.user_info
    #byebug
end

end


