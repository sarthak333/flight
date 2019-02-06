class SeatsController < ApplicationController
  def new
    #number=1
    @seatcat=Seatcat.find(params[:seatcat_id])
    if !@seatcat.seats.any?
    @seatcat.row.times do |r|
      @seatcat.column.times do |d|
        @seat= @seatcat.seats.create()
        #@seat.update_column(:number, number)
        #number=number+1
        #@seat.update_column(:break, @seatcat.column)
        #if @seat.id % @seatcat.column == 0 || @seat.id % @seatcat.column == 1
        #@seat.update_column(:position, "window")
        end
end
end

end
    end
