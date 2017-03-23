class UserInfo 
attr_reader :name,
            :followers,
            :following,
            :repos,
            :image

  def initialize(user_information)
    @name      = user_information[:name]
    @followers = user_information[:followers]
    @following = user_information[:following]
    @repo      = user_information[:public_repos]
    @image     = user_information[:avatar_url]
  end

  def self.find_user_info(current_user)
      details = GithubService.new(current_user)
      user_information = details.user_info
      new(user_information)
  end
end


