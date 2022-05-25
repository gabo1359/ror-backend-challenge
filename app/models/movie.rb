# frozen_string_literal: true

class Movie < ApplicationRecord
  belongs_to :genre
  has_and_belongs_to_many :characters
end
