# frozen_string_literal: true

class CharacterSerializer < ActiveModel::Serializer
  attributes :name, :age, :weight, :story

  has_many :movies

  def story
    object.story.nil? ? 'N/A' : object.story
  end
end
