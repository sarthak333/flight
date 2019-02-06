class AirplanesController < ApplicationController
  def new
    @airplane= Airplane.new
  end

  def show
  end

  def create
    @airplane= Airplane.create(airplane_params)
    if @airplane.save
      flash[:success]="Airplane Added"
      redirect_to addconfig_path(:airplane_id => @airplane.id)
    else
      flash[:danger]="Cannot be saved"
      render 'new'
    end
  end

  def add
  end

  def addconfiguration
    @airplane=Airplane.find(params[:airplane_id])
    puts "testbug"
    puts "addconfiguration"
  end

  def postadd
    puts "testbug"
    puts "postadd"
    @airplane=Airplane.find(params[:airplane_id])

    @seatconfig=Seatconfig.find(params[:seatconfig_id])
    @scnew=Seatconfig.create(:name=>@airplane.name)
    @scnew.update(:show=> false)
    @seatconfig.seatcats.each do |s|
        @sc=@scnew.seatcats.create(:name => s.name, :row => s.row, :column=> s.column, :baseprice=> s.baseprice)
      s.row.times do |r|
        s.column.times do |c|
        @sc.seats.create()
    end
  end
  end
    @airplane.update(:seatconfig_id=>@scnew.id)
    flash[:success]="added"
    redirect_to root_path
end


  private
  def airplane_params
    params.require(:airplane).permit(:name)
  end
end
