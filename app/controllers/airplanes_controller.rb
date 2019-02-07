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

  end

  def postadd
    @airplane=Airplane.find(params[:airplane_id])
    @seatconfig=Seatconfig.find(params[:seatconfig_id])
    @scnew=Seatconfig.create(:name=>@airplane.name)
    @scnew.update(:show=> false)
    @seatconfig.seatcats.each do |s|
      number=1;
        @sc=@scnew.seatcats.create(:name => s.name, :row => s.row, :column=> s.column, :baseprice=> s.baseprice)
      s.row.times do |r|
        s.column.times do |c|
          @fs=@sc.seats.create()
        @fs.update_column(:number, number)
        number=number+1
        @fs.update_column(:break, s.column)

          if @fs.number % @fs.break == 0 || @fs.number % @fs.break == 1
          @fs.update_column(:position, "window")
      
      end
        if s.column%2==0

          if @fs.number % (s.column/2)==0 || @fs.number % (s.column/2)==1
          if @fs.position === "window"
          else
          @fs.update_column(:position, "aisle")
          end
        end
      else
        if (@fs.number+(s.column/2))% s.column==0 || (@fs.number+((s.column/2)-1))%s.column==0
        if @fs.position === "window"
        else
        @fs.update_column(:position, "aisle")
        end
      end
      end
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
