# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Initializing the seed...'

15.times do
  begin
    Genre.create(name: Faker::Book.genre)
  rescue
    next
  end
end

30.times do
  Movie.create(
    title: Faker::Movie.title,
    creation_date: Faker::Date.between(from: '2000-01-01', to: '2021-12-31'),
    rating: rand(1..5),
    genre_id: rand(1..Genre.count)
  )
end

30.times do
  character = Character.create(
    name: Faker::Name.name,
    age: rand(18..65),
    weight: rand(35.0..100).round(2),
    story: Faker::Lorem.sentence(word_count: 15, supplemental: true)
  )
  rand(1..4).times do
    CharactersMovie.create(
      character_id: character.id,
      movie_id: rand(1..Movie.count)
    )
  end
end

puts 'Faked database created!'
