# frozen_string_literal: true

class Movies::GetMovies < BaseService
  attr_reader :query_params

  def initialize(args)
    @query_params = args
  end

  def call
    movies = Movies::GetMoviesQuery.call(query_params)
    movies.map do |movie|
      {
        title: movie.title,
        creation_date: movie.creation_date,
        image: movie.image.url || 'N/A'
      }
    end
  end
end
