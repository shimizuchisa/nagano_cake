class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path
      flash[:notice] = "登録が完了しました"
    else
      @genres = Genre.all
      render 'index'
    end
  end

  def edit
    @genre = Genre.find(params[:id])

  end

  def update
    ＠genre = Genre.find(params[:id])
    ＠genre.update(genre_params)
    redirect_to admin_genres_path
    flash[:notice] = "更新が完了しました"
  end

  private

  def genre_params
    params.require(:genre).permit(:genre_name)
  end
end
