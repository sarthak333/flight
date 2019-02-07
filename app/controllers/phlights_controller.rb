class PhlightsController < ApplicationController
  def new
    @phlight=Phlight.new
  end

  def show
  end

  def create
    @phlight= Phlight.create(phlight_params)
    if @phlight.save
      flash[:success]="Flight Added. Add Airplane"
      redirect_to addairplane_path(:phlight_id=> @phlight.id)
    else
      flash[:danger]="Cannot be saved"
      render 'new'
    end
  end

  def addairplane
  end

def addplane
  @airplane=Airplane.find(params[:airplane_id])
  @phlight= Phlight.find(params[:phlight_id])
  @ap=Airplane.create(:name=>@airplane.name, :show=>false)
  @scon= Seatconfig.find(@airplane.seatconfig_id)
  @nscon=Seatconfig.create(:name=>@scon.name, :show=>false)
  @ap.update(:seatconfig_id=>@nscon.id)
  @scon.seatcats.each do |a|
    number=1
  @nscat= @nscon.seatcats.create(:name=>a.name,:row => a.row, :column=> a.column, :baseprice=> a.baseprice)
  a.row.times do |r|
    a.column.times do |c|
      @fs=@nscat.seats.create()
      @fs.update_column(:number, number)
      number=number+1
      @fs.update_column(:break, a.column)
      if @fs.id % a.column == 0 || @fs.id % a.column == 1
        if @fs.number % @fs.break == 0 || @fs.number % @fs.break == 1
        @fs.update_column(:position, "window")
        end
      end
        if a.column%2==0
          if @fs.number % (a.column/2)==0 || @fs.number % (a.column/2)==1
          if @fs.position === "window"
          else
          @fs.update_column(:position, "aisle")
          end
        end
      else
        if (@fs.number+(a.column/2))% a.column==0 || (@fs.number+((a.column/2)-1))%a.column==0
        if @fs.position === "window"
        else
        @fs.update_column(:position, "aisle")
        end
      end
      end

    end
    end
    end
  @phlight.update(:airplane_id=> @ap.id)
  puts "addplane"
  puts "testbug"
  flash[:success]="Airplane has been added successfully"
  redirect_to root_path
end

  private
  def phlight_params
    params.require(:phlight).permit(:name, :origin, :destination)
  end

end
