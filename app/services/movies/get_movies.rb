# frozen_string_literal: true

class Movies::GetMovies < BaseService
  attr_reader :query_params

  def initialize(args)
    @query_params = args
  end

  def call
    movies = Movie.all
    movies.map do |movie|
      {
        title: movie.title,
        creation_date: movie.creation_date
      }
    end
  end
end
