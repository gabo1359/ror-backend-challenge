# frozen_string_literal: true

class Characters::GetCharacters < BaseService
  attr_reader :args

  def initialize(args)
    @args = args
  end

  def call
    Character.all.map do |character|
      { name: character.name }
    end
  end
end
