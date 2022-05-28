# frozen_string_literal: true

class Movies::GetMoviesQuery < BaseQuery
  attr_reader :title, :creation_date, :genre_id

  def initialize(args)
    @title = args[:title]
    @creation_date = args[:creation_date]
    @genre_id = args[:genre_id]
  end

  def call
    movies = creation_date.present? ? ordered_movies : Movie.all
    movies = movies.where(genre_id: genre_id) if genre_id.present?
    movies = movies.where(title: title) if title.present?
    movies
  end

  private

  def ordered_movies
    creation_date == 'desc' ? Movie.order(creation_date: :desc) : Movie.order(:creation_date)
  end
end
