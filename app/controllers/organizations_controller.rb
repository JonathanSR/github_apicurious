class OrganizationsController < ApplicationController
before_action :authorize!

  def index
    @organizations = Organization.find_organization_information(current_user)
  end
end