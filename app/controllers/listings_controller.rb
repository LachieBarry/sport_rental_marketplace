class ListingsController < ApplicationController
  # Will need a before action I think, one to allow non-users to search still?
  # Do photos get added here? Sounds like a tomorrow job
  before_action :set_listing, only: [:show]

  def index
    @listings = Listing.all
  end

  def show
    set_listing
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to listing_path(@listing)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit

  end

  def update

  end

  private

  def listing_params
    # Protects against CRLF injection
    # Need to pass photo later
    params.require(:listing).permit(:title, :sport_type, :description, :hourly_price)
  end

  def set_listing
    # Finds model per id
    @listing = Listing.find(params[:id])
  end
end
