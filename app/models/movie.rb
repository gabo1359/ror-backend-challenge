# frozen_string_literal: true

# == Schema Information
#
# Table name: movies
#
#  id            :bigint           not null, primary key
#  creation_date :datetime
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
class Movie < ApplicationRecord
  belongs_to :genre
  has_and_belongs_to_many :characters
end
