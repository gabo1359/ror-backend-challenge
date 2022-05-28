# frozen_string_literal: true

class Characters::GetCharacters < BaseService
  def initialize(args)
    args = args
  end

  def call
    Character.all.map do |character|
      { name: character.name }
    end
  end
end
