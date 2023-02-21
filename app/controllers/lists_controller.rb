class ListsController < ApplicationController
  def index
    @title = "Add your favourite movies"
    @photo = 'movies_tgr7cc.jpg'
    @lists = List.all
  end

  def new
    @list = List.new
    @title = "Add your favourite movies"
    @photo = 'movies_tgr7cc.jpg'
  end

  def create
    @list = List.new(list_params)
    @photo = 'movies_tgr7cc.jpg'
    @title = "Add your favourite movies"
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @list = List.find(params[:id])
    @title = @list.name
    @photo = @list.photo.key
    @bookmarks = @list.bookmarks
    @bookmark = Bookmark.new
    @movies = Movie.all
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
