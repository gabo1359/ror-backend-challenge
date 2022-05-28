# frozen_string_literal: true

class Movies::Creator < BaseService
  attr_reader :params

  def initialize(args)
    @params = args
  end

  def call
    movie = Movie.new(params)
    if movie.valid?
      movie.save
      movie
    else
      movie.errors
    end
  end
end
