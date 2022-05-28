# frozen_string_literal: true

class Characters::GetCharactersQuery < BaseQuery
  attr_reader :name, :age, :weightier_than, :lightier_than, :movie_id

  def initialize(args)
    @name = args[:name]
    @age = args[:age]
    @weightier_than = args[:weightier_than]
    @lightier_than = args[:lightier_than]
    @movie_id = args[:movie_id]
  end

  def call
    characters = movie_id.present? ? Character.includes(:movies).where(movies: { id: movie_id }) : Character.all
    characters = weightier_than.present? ? characters.where('weight > ?', weightier_than) : characters
    characters = lightier_than.present? ? characters.where('weight < ?', lightier_than) : characters
    characters = age.present? ? characters.where(age: age) : characters
    characters = name.present? ? characters.where(name: name) : characters
    characters
  end
end
