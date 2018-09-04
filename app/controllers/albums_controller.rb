class AlbumsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: [:destroy, :update]

  def index
    @albums = Album.paginate(page: params[:page])
  end

  def new
    @album = Album.new
    @album.photos.build_album
  end

  def create
    @album = current_user.albums.build(album_params) #создает новое взаимоотношение, запрос post
    if @album.save
      redirect_to root_url, notice: "Альбом сохранен!"
    else
      @feed_items = []
      render 'main/index'
    end
  end

  def edit
  end

  def show
    @album = Album.find(params[:id])
    render 'albums/show'
  end

  def update
    @album = Album.find_by_id(params[:id])
    if @album.update_attributes(album_params)
      #обработать успешное изменение
      redirect_to root_url, notice: 'Альбом обновлен'
    else
      render 'edit'
    end
  end

  def destroy
    @album.destroy
    redirect_to request.referrer || root_url, notice: 'Альбом удален'
    #request.referrer - переадресует на предыдущий url
  end

  #определяем строгие параметы, что можно редактировать
  private
    def album_params
      params.require(:album).permit(:competition, :album_name, :album_description,
                                    photos_attributes: [:id, :album_id, :file, :ave_value, :_destroy])
    end

    def correct_user
      @album = current_user.albums.find_by(id: params[:id])
      redirect_to root_url if @album.nil?
    end

end
