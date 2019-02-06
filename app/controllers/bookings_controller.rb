class BookingsController < ApplicationController
  def new
    @del=Booking.where(confirm: false)
    @del.each do |d|
      d.tempseats.destroy_all
    end
    @del.destroy_all
    @booking=Booking.create(:user_id=>current_user.id, :flight_id=>params[:flight_id])

  end

def select
  @booking=Booking.find(params[:booking_id])
  @seat=Seat.find(params[:seat_id])
  @secat= @seat.seatcat
  if @booking.tempseats.where(seat_id: @seat.id).exists?
     d=@booking.tempseats.where(seat_id: @seat.id)
    @booking.tempseats.destroy(d.first.id)
  else
  @booking.tempseats.create(:price=>@secat.baseprice, :seat_id=>@seat.id, :emergency=>@seat.emergency, :booking_id=>@booking.id, :position=>@seat.position)
end
end

def invalid
flash[:danger]="Seat not available"
redirect_back(fallback_location: root_path)
end


end
