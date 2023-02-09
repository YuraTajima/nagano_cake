class Admin::GenresController < ApplicationController
  
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    genre = Genre.new(genre_params)
    genre.save
    redirect_to "admin/genres#index"
  end

  def edit
  end

  def update
  end
  
end
