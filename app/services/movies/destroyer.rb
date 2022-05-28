# frozen_string_literal: true

class Movies::Destroyer < BaseService
  attr_reader :id

  def initialize(args)
    @id = args[:id]
  end

  def call
    movie = Movie.find(id)
    movie.destroy
  end
end
