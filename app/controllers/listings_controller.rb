class ListingsController < ApplicationController
  # Will need a before action I think, one to allow non-users to search still?
  # Do photos get added here? Sounds like a tomorrow job

  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
  end

end
