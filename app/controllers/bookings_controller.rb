class BookingsController < ApplicationController

  def confirm
    @booking = Booking.find(params[:listing_id])
    @booking.accepted = 1
    @booking.save
  end

  def reject
    @booking = Booking.find(params[:listing_id])
    @booking.accepted = 2
    @booking.save
  end

  def index
    @listing_ids = []
    @listings_filtered = Listing.where(user_id: current_user)
    @listings_filtered.each do |listing|
      @listing_ids.push(listing.id)
    end
    @owner_bookings = Booking.where(listing_id: @listing_ids)
  end

  def new
    @listing = Listing.find(params[:listing_id])
    @booking = Booking.new
  end

  def create
    # STILL NEED TO IMPLEMENT FLATPICKR
    @listing = Listing.find(params[:listing_id])
    @booking = Booking.new(booking_params)
    @booking.listing_id = @listing.id
    @booking.user_id = current_user.id
    @booking.total_price = ((@booking.end_date - @booking.start_date) / 3600) * @listing.hourly_price
    @booking.save
    redirect_to listing_path(@listing)
  end

  def show
    @booking = Booking.find(params[:listing_id])
  end

  def destroy
    @booking = Booking.find(params[:id])
    @listing = Listing.find(@booking.listing_id)
    @booking.destroy
    redirect_to listing_path(@listing), status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price, :listing_id, :user_id)
  end
end
