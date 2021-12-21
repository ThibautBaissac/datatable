require 'faker'

# DESTOY ALL
puts "Destroying all Movies"
Movie.destroy_all

puts "--------"

# CREATE WORKS
100.times do
  movie = Movie.new(title: Faker::Movie.title,
  quote: Faker::Movie.quote,
  rating: Random.rand(1..5),
  release_date: Faker::Date.between(from: '1950-01-01', to: Date.today))
  movie.save!
  puts "Created movie : #{movie.title}"
end


puts "--------"
puts "Successful seed creation"
