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


private
def search_params
  params.require(:search).permit(:origin, :destination)
end
end
