class MainController < ApplicationController
  def index
    if logged_in?
      @album = current_user.albums.build #определяем через ассоциацию
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

end
