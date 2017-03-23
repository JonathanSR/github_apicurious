class OrganizationsController < ApplicationController

  def index
    @organizations = Organization.find_organization_information(current_user)
  end
end