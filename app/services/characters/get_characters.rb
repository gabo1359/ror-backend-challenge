# frozen_string_literal: true

class Characters::GetCharacters < BaseService
  attr_reader :query_params

  def initialize(args)
    @query_params = args
  end

  def call
    characters = Characters::GetCharactersQuery.call(query_params)
    # characters.map do |character|
    #   { name: character.name }
    # end
  end
end
