# frozen_string_literal: true

class Api::V1::MoviesController < ApplicationController
  def index
    movies = Movies::GetMovies.call(params)
    render json: { data: movies }
  end

  def show
    movie = Movie.find(params[:id])
    render json: movie
  end

  def create
    movie = Movies::Creator.call(set_movie_params)
    render json: movie, status: :created
  end

  def update
    movie = Movies::Updater.call(id: params[:id], params: set_movie_params)
    render json: movie
  end

  def destroy
    Movies::Destroyer.call(id: params[:id])
    head :no_content
  end

  private

  def set_movie_params
    params.require(:movie).permit(:title, :creation_date, :rating, :genre_id, :image)
  end
end
