require 'rails_helper'

describe GithubService do
  attr_reader :service

  before(:each) do
    current_user = User.create!(uid:"13320451", username:"JonathanSR")
    @service = GithubService.new(current_user)
  end

  describe '#user_info' do
    it "can find user info" do 
    user_info = @service.user_info
    #byebug

    expect(user_info[:name]).to eq("Jonathan Serrano")
    expect(user_info[:followers]).to eq(3)
    expect(user_info[:following]).to eq(6)
    expect(user_info[:public_repos]).to eq(28)
    expect(user_info[:avatar_url]).to eq("https://avatars0.githubusercontent.com/u/13320451?v=3")
            
    end
  end

  describe "#repo info" do
    it "can find repo info" do
    repo_info = @service.repos 

    expect(repo_info.first[:name]).to eq("advanced_enums-1")
    expect(repo_info.first[:fork]).to eq(true)
   # expect(repo_info.first[:fork_count]).to_i.to eq(0)
    expect(repo_info.first[:language]).to eq("Ruby")
    expect(repo_info.first[:updated_at]).to eq("2017-01-05T16:27:24Z")
    expect(repo_info.first[:private]).to eq(false)
    end
  end

  describe "#organizations info" do 
    it "can find organization info" do
    org_info = @service.organizations

    expect(org_info[:name]).to_not eq("organization")
    end
  end
    
  describe "#followers info" do 
    it "can find followers info" do 
      followers_info = @service.followers
      #byebug
      expect(followers_info.first[:login]).to eq("Carmer")
      expect(followers_info.first[:avatar_url]).to eq("https://avatars0.githubusercontent.com/u/9501766?v=3")
      expect(followers_info.first[:html_url]).to eq("https://github.com/Carmer")
    end
  end    
end