class ListsController < ApplicationController
before_action :set_list, only: %i[show destroy]
def index
  @lists = List.all
end

def show
  @bookmark = Bookmark.new
  @list = List.find(params[:id])
end

def new
  @list = List.new
end

def create
  @list = List.new(list_params)
  if @list.save
    redirect_to @list
  else
    render :new
  end
end

private

def list_params
  params.require(:list).permit(:name)
end

def set_list
  @list = List.find(params[:id])
end
end
