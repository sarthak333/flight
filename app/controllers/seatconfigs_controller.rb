class SeatconfigsController < ApplicationController

  def new
    @seatconfig= Seatconfig.new
  end

  def show
  end

  def create
    @seatconfig= Seatconfig.create(seatconfig_params)
    if @seatconfig.save
      flash[:success]="Configuration Template Created. Add Seat Classes"
      redirect_to newseatcat_path(:seatconfig_id=> @seatconfig.id)
    else
      flash[:danger]="Cannot be saved"
      render 'new'
    end
  end

  private
  def seatconfig_params
    params.require(:seatconfig).permit(:name)
  end

end
