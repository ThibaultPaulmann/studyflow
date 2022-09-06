class UsefulResourceController < ApplicationController
  def index
    @resource_links = UsefulResource.find(params[:id])
  end
end
