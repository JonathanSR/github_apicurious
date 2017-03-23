class Organization
attr_reader :name,
            :url,
            :image,
            :description

  def initialize(org)
    @name        = org[:login]
    @url         = org[:url]
    @image       = org[:avatar_url]
    @description = org[:description]
  end

  def self.find_organization_information(current_user)
    details = GithubService.new(current_user)
    org_information = details.organizations.map do |org|
      new(org)
      byebug
    end
  end     
end