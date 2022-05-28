# frozen_string_literal: true

# == Schema Information
#
# Table name: characters
#
#  id         :bigint           not null, primary key
#  age        :integer
#  name       :string
#  story      :text
#  weight     :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CharacterSerializer < ActiveModel::Serializer
  attributes :name, :age, :weight, :story

  has_many :movies

  def story
    object.story.nil? ? 'N/A' : object.story
  end
end
