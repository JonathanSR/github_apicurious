class User < ApplicationRecord
  #@client_id = #

  def self.from_github(data, access_token)
    user = User.find_or_create_by(uid: data['id'])
    user.username = data['login']
    user.token = access_token
    user.email    = data['email']
    user.image    = data['avatar_url']
    user.followers = data['followers']
    user.following = data['following']
    user.repos = data['repos_url']
    user.public_repos = data['public_repos']
    user.starred  = data['starred_url']
    user.name = data['name']
    user.save
    user
  end
end

