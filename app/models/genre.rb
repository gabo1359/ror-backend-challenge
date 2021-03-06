# frozen_string_literal: true

# == Schema Information
#
# Table name: genres
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Genre < ApplicationRecord
  has_many :movies

  validates :name, presence: true, uniqueness: true, length: { minimum: 2 }
end
