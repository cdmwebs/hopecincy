class OrganizationsController < ApplicationController
  respond_to :html

  def new
    @organization = Organization.new(:donor => (params[:org_type] == 'donor'))
    respond_with @organization
  end

  def create
    @organization = Organization.new(params[:organization])
    if @organization.save
      flash[:notice] = 'Your organization was submitted for approval!'
    else
      flash[:error] = "We weren't able to submit your organization. Please check the errors below"
    end
    respond_with(@organization, :location => root_path)
  end

  def show

  end

end
