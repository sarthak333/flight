class BookingsController < ApplicationController
  def new
    @left=Booking.where(confirm: true)
    @left.each do |l|
      if l.tempseats.count==0
        @left.destroy(l.id)
      end
    end
    @del=Booking.where(confirm: false)
    @del.each do |d|
      d.tempseats.destroy_all
    end
    @del.destroy_all
    @booking=Booking.create(:user_id=>current_user.id, :flight_id=>params[:flight_id])

  end


def show
@booking=Booking.find(params[:booking_id])
end

def select
  @booking=Booking.find(params[:booking_id])
  @seat=Seat.find(params[:seat_id])
  @secat= @seat.seatcat
  if @booking.tempseats.where(seat_id: @seat.id).exists?
     d=@booking.tempseats.where(seat_id: @seat.id)
    @booking.tempseats.destroy(d.first.id)
  else
  @booking.tempseats.create(:price=>@secat.baseprice, :seat_id=>@seat.id, :emergency=>@seat.emergency, :booking_id=>@booking.id, :position=>@seat.position, :final=> true)
end
end

def seeprice
  @booking=Booking.find(params[:booking_id])

end
def confirm
  @booking=Booking.find(params[:booking_id])
  flash[:success]="Booking has been successful"
  @booking.update_column(:confirm, true)
  @booking.tempseats.each do |b|
    @seat=Seat.find(b.seat_id)
    @seat.update_column(:available, false)
    @seat.update_column(:booking_id, @booking.id)
  end
  redirect_to root_path
end

def invalid
flash[:danger]="Seat not available"
redirect_back(fallback_location: root_path)
end

def modify
    @des=Tempseat.where(final: false, old: false)
    @des.each do |ds|
    puts ds.id
    puts "modify des destroy"
    Tempseat.destroy(ds.id)
  end

  @del=Booking.where(confirm: false)
  @del.each do |d|
    d.tempseats.destroy_all
  end
  @del.destroy_all
  @booking=Booking.find(params[:booking_id])
  @booking=Booking.find(params[:booking_id])
  @flight=Phlight.find(@booking.flight_id)
  @airplane=Airplane.find(@flight.airplane_id)
  @seatconfig=Seatconfig.find(@airplane.seatconfig_id)
end
def addseat
  @booking=Booking.find(params[:booking_id])
  @price=@booking.tprice
  @seat=Seat.find(params[:seat_id])
  query=@booking.tempseats.where(seat_id: @seat.id)
  if query.exists?
    query.destroy_all
    if @seat.position==="middle"
      @price=@price-@seat.seatcat.baseprice
    else
      @price=@price-@seat.seatcat.baseprice-(0.5*@seat.seatcat.baseprice)
    end
    else
      if @seat.position==="middle"
        @price=@price+@seat.seatcat.baseprice
      else
        @price=@price+@seat.seatcat.baseprice+(0.5*@seat.seatcat.baseprice)
      end
      @booking.tempseats.create(:seat_id=>@seat.id, :emergency=> @seat.emergency, :position=>@seat.position, :old=> false, :final=>true)
    end
    @booking.update_column(:tprice, @price)

end

def removeseat
  @booking=Booking.find(params[:booking_id])
  @price=@booking.tprice
  @seat=Seat.find(params[:seat_id])
  query=@booking.tempseats.where(seat_id: @seat.id).first
  query.toggle!(:final)
  if query.final
  if @seat.position==="middle"
    @price=@price+@seat.seatcat.baseprice
  else
    @price=@price+@seat.seatcat.baseprice
   end
 else
   if @seat.position==="middle"
     @price=@price-@seat.seatcat.baseprice
   else
     @price=@price-@seat.seatcat.baseprice
    end
  end
   @booking.update_column(:tprice, @price)
end

def accept
  @booking=Booking.find(params[:booking_id])
  price=@booking.price+@booking.tprice
  @booking.update_column(:price, price)
  tempold=@booking.tempseats.where(:final=>false)
  tempold.each do |t|
    seat=Seat.find(t.seat_id)
    seat.update(:available=> true, :booking_id=>nil)
  end
  tempold.destroy_all
  tempnew=@booking.tempseats.where(:old=> false, :final=>true)
  tempnew.each do |n|
    n.update_column(:old, true)
    s=Seat.find(n.seat_id)
    s.update(:available=> false, :booking_id=> @booking.id)
  end
  flash[:success]="Modifications made"
  redirect_to root_path
  end


def conchange
  @booking=Booking.find(params[:booking_id])
end

def change

end

end
