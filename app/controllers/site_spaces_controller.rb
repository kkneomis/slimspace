class SiteSpacesController < ApplicationController
  layout "onsite"

  def index
    @user = User.where(:site_slug => request.subdomain).first
  end

  def new
  end

  def show
  end

  def create
  end

  def update
  end
end
