# frozen_string_literal: true

class MovieSerializer < ActiveModel::Serializer
  attributes :title, :rating, :genre

  has_many :characters
  
  def genre
    object.genre.name
  end
end
