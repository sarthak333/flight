class SeatsController < ApplicationController
  def new
    number=1
    @seatcat=Seatcat.find(params[:seatcat_id])
    if !@seatcat.seats.any?
    @seatcat.row.times do |r|
      @seatcat.column.times do |d|
        @seat= @seatcat.seats.create()
        @seat.update_column(:number, number)
        number=number+1
        @seat.update_column(:break, @seatcat.column)
        if @seat.number % @seat.break == 0 || @seat.number % @seat.break == 1
        @seat.update_column(:position, "window")
        end
        if @seatcat.column%2==0
          if @seat.number % (@seatcat.column/2)==0 || @seat.number % (@seatcat.column/2)==1
          if @seat.position != "window"
          @seat.update_column(:position, "aisle")
          end
        end
      else
        if (@seat.number+(@seatcat.column/2))% @seatcat.column==0 || (@seat.number+((@seatcat.column/2)-1))%@seatcat.column==0
        if @seat.position != "window"
        @seat.update_column(:position, "aisle")
        end
      end
      end

end
end

end
    end
  end
