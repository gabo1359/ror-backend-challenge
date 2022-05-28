# frozen_string_literal: true

class Movies::Updater < BaseService
  attr_reader :id, :params

  def initialize(args)
    @id = args[:id]
    @params = args[:params]
  end

  def call
    movie = Movie.find(id)
    if movie.update(params)
      movie
    else
      movie.errors
    end
  end
end
