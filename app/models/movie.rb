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
class Movie < ApplicationRecord
  belongs_to :genre
  has_and_belongs_to_many :characters

  has_one_attached :image

  validates :title, presence: true, uniqueness: true, length: { minimum: 2 }
  validates :creation_date, presence: true, format: { with: /\d{4}(-\d{2}){2}/,
            message: 'incorrect format of date (YYYY-MM-DD)' }
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1,
                                                     less_than_or_equal_to: 5 }
end
