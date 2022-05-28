# frozen_string_literal: true

class Characters::Creator < BaseService
  attr_reader :args

  def initialize(args)
    @args = args
  end

  def call
    character = Character.new(args)
    if character.valid?
      character.save
      character
    else
      { errors: character.errors }
    end
  end
end
