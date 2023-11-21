class BookingsController < ApplicationController

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
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price, :listing_id, :user_id)
  end
end
