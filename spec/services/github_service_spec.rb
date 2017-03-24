require 'rails_helper'

describe GithubService do
attr_reader :service

  before(:each) do
    current_user = User.create!(uid:"13320451", username:"JonathanSR", token:"7dd9c78a5ef6107a0f2be55d62beeec4acf676fe" )
    @service = GithubService.new(current_user)
  end

  describe '#user' do
    it "can find user info" do 
      user_info = @service.user_info

      expect(user_info[:name]).to eq("Jonathan Serrano")
      expect(user_info[:followers]).to eq(3)
      expect(user_info[:following]).to eq(6)
      expect(user_info[:public_repos]).to eq(28)
      expect(user_info[:avatar_url]).to eq("https://avatars0.githubusercontent.com/u/13320451?v=3")
    end
  end

  describe "#repo" do
    it "can find repo info" do
      repo_info = @service.repos 

      expect(repo_info.first[:name]).to eq("abandoned_camel_coffee_mercantile")
      expect(repo_info.first[:fork]).to eq(false)
      expect(repo_info.first[:language]).to eq("Ruby")
      expect(repo_info.first[:updated_at]).to eq("2017-02-21T22:05:23Z")
      expect(repo_info.first[:private]).to eq(false)
      end
    end

  describe "#organizations" do 
    it "can find organization info" do
      org_info = @service.organizations

      expect(org_info.first[:login]).to eq("Turing-Pahlka-Posse")
      expect(org_info.first[:url]).to eq("https://api.github.com/orgs/Turing-Pahlka-Posse")
      expect(org_info.first[:avatar_url]).to eq("https://avatars1.githubusercontent.com/u/18356491?v=3")
      expect(org_info.first[:description]).to eq("A Posse at Turing's School of Software and Design set up to focus on projects that help those around us.")
    end
  end
    
  describe "#followers" do 
    it "can find followers info" do 
      followers_info = @service.followers
      
      expect(followers_info.first[:login]).to eq("Carmer")
      expect(followers_info.first[:avatar_url]).to eq("https://avatars0.githubusercontent.com/u/9501766?v=3")
      expect(followers_info.first[:html_url]).to eq("https://github.com/Carmer")
    end
  end

  describe "#commits" do
    it "can find commits info" do
      commits_info = @service.commits

      expect(commits_info.first[:type]).to eq("PushEvent")
      expect(commits_info.first[:repo][:name]).to eq("JonathanSR/github_apicurious") 
      expect(commits_info.first[:payload][:commits][0][:message]).to eq("creates following and commits poros with controllers and views")           
      expect(commits_info.first[:created_at]).to eq("2017-03-23T23:38:47Z")   
    end
  end   

  describe "events" do
    it "can find recent people following events" do
      events_info = @service.events

      expect(events_info.first[:type]).to eq("WatchEvent")
      expect(events_info.first[:actor][:login]).to eq("maxglassie")
      expect(events_info.first[:repo][:name]).to eq("briancaffey/reddit-graph-analysis")
      expect(events_info.first[:repo][:url]).to eq("https://api.github.com/repos/briancaffey/reddit-graph-analysis")
      expect(events_info.first[:created_at]).to eq("2017-03-23T02:27:11Z")   
    end
  end
  
end