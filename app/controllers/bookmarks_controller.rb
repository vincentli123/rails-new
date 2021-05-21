class BookmarksController < ApplicationController
def create
  @list = List.find(params[:list_id])
  @bookmark = Bookmark.new(bookmark_params)
  @bookmark.list = @list
  @bookmark.save
  redirect_to list_path(@list)
end

private

def bookmark_params
  params.require(:bookmark).permit(:movie_id, :comment)
end

end
