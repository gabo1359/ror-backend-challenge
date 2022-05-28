# frozen_string_literal: true

# == Schema Information
#
# Table name: movies
#
#  id            :bigint           not null, primary key
#  creation_date :date
#  rating        :integer
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  genre_id      :bigint           not null
#
# Indexes
#
#  index_movies_on_genre_id  (genre_id)
#
# Foreign Keys
#
#  fk_rails_...  (genre_id => genres.id)
#
class MovieSerializer < ActiveModel::Serializer
  attributes :title, :rating, :genre

  has_many :characters

  def genre
    object.genre.name
  end
end
