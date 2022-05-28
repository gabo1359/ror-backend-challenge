# frozen_string_literl: true

class Characters::Destroyer < BaseService
  attr_reader :id

  def initialize(args)
    @id = args[:id]
  end

  def call
    character = Character.find(id)
    character.destroy
  end
end
