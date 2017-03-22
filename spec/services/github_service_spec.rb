require 'rails_helper'

describe GithubService do
  attr_reader :service

  before(:each) do
    @service = GithubService.new(current_user, access_token)
  end

  describe '#user_info' do
    it "can find user info" do 
    user_info = @service.user_info

    expect(user_info[:name].to eq("Jonathan Serrano"))
    end
  end
end