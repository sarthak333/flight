class SearchsController < ApplicationController


def createsearch
@search=Search.create(search_params)
render 'searchresult'
end
def error
  redirect_to root_path
end
def searchresult
end

def pnr
  @pnr=params[:store]
  if Booking.where(pnr: @pnr).exists?
  @booking= Booking.where(pnr: @pnr).first
  render 'pnr'
  else
    flash[:danger]="PNR doesn't exist."
    redirect_to root_path
  end
end

private
def search_params
  params.require(:search).permit(:origin, :destination, :sdate, :stime)
end
end
