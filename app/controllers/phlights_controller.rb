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
  @ap.update_column(:seatconfig_id,@nscon.id)
  @scon.seatcats.each do |a|
  @nscat= @nscon.seatcats.create(:name=>a.name,:row => a.row, :column=> a.column, :baseprice=> a.baseprice)
  a.row.times do |r|
    a.column.times do |c|
      @nscat.seats.create()
    end
    end
    end
  @phlight.update_column(:airplane_id, @ap.id)
  puts @ap
  puts @ap.id
  puts "testbug"
  flash[:success]="Airplane has been added successfully"
  render 'show'
end

  private
  def phlight_params
    params.require(:phlight).permit(:name, :origin, :destination)
  end

end
