class SeatcatsController < ApplicationController

  def new
    @seatconfig=Seatconfig.find(params[:seatconfig_id])
    @seatcat= @seatconfig.seatcats.new
  end

  def create
      @seatconfig=Seatconfig.find(params[:seatconfig_id])
    @seatcat= @seatconfig.seatcats.create(seatcat_params)
    if @seatcat.save
      flash[:success]="Seat Class Created. Add the minor details"
    redirect_to newseatprofile_path(:seatcat_id => @seatcat.id)
    else
      flash[:danger]="Cannot be saved"
      render 'new'
    end
  end

    private
    def seatcat_params
      params.require(:seatcat).permit(:name, :row, :column, :baseprice)
    end

end
