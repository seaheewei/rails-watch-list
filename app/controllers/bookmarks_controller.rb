class BookmarksController < ApplicationController

  def create
    @bookmarks = Bookmark.all
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @photo = @list.photo.key
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@bookmark.list)
    else
      render "lists/show", status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
