# frozen_string_literal: true

class Characters::Updater < BaseService
  attr_reader :id, :params

  def initialize(args)
    @id = args[:id]
    @params = args[:params]
  end

  def call
    character = Character.find(id)
    if character.update(params)
      character
    else
      character.errors
    end
  end
end
