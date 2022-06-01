# frozen_string_literal: true

# == Schema Information
#
# Table name: characters
#
#  id         :bigint           not null, primary key
#  name       :string
#  age        :integer
#  weight     :float
#  story      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Character < ApplicationRecord
  has_and_belongs_to_many :movies

  has_one_attached :image

  validates :name, presence: true, length: { minimum: 2 }
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 18,
                                                  less_than_or_equal_to: 65 }
  validates :weight, presence: true
end
