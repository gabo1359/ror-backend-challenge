# frozen_string_literal: true

# == Schema Information
#
# Table name: characters_movies
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  character_id :bigint           not null
#  movie_id     :bigint           not null
#
# Indexes
#
#  index_characters_movies_on_character_id  (character_id)
#  index_characters_movies_on_movie_id      (movie_id)
#
# Foreign Keys
#
#  fk_rails_...  (character_id => characters.id)
#  fk_rails_...  (movie_id => movies.id)
#
class CharactersMovie < ApplicationRecord
  belongs_to :character
  belongs_to :movie
end
