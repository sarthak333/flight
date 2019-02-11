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
  @booking= Booking.where(pnr: @pnr).first
  render 'pnr'
end

private
def search_params
  params.require(:search).permit(:origin, :destination, :sdate, :stime)
end
end
