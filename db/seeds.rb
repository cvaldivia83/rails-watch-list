require 'json'
require 'open-uri'

list = [
  11, 12, 13, 14, 15, 16, 18, 22, 24, 28, 38, 55, 58, 62, 64, 70, 71, 73, 75, 78, 85, 87, 88, 89, 95, 99, 101, 105, 114, 118, 120, 121, 122, 134, 140, 153, 161, 162, 163, 164, 165, 184, 185, 187, 192, 194, 196, 217, 218, 219, 238, 240, 242, 252, 274, 275, 285, 298, 329, 338, 393, 401, 424, 429, 433, 524, 546, 550, 561, 563, 598, 601, 603, 627, 630, 680, 694, 713, 745, 752, 769, 773, 775, 856, 862, 872, 1424, 1443, 1493, 1541, 1648, 1714, 1845, 1887, 1991, 2062, 2108, 2259, 2266, 2288, 2567, 2667, 3082, 3172, 4011, 4232, 4348, 4538, 4922, 5038, 6435, 6639, 8130, 8587, 9377, 9447, 9603, 10144, 10468, 10548, 10625, 11042, 1391, 13597, 15917, 22512, 28644, 36685, 40807, 44214, 44826, 59436, 59967, 13223, 83666, 96936, 152532, 16869, 27205, 31225, 40096, 57977, 64682, 68718, 70523, 76341, 106646, 136795, 140823, 157336, 244786, 258216, 265195, 329865, 333339, 334533, 338967, 376867, 614934, 354912, 381284, 419430, 402900, 442064, 446159, 447332, 475557, 490132, 496243, 530915, 551332, 554230, 618162
]

api_key = "715dec9fac7e34b969975d8a2d85b7ed"

puts "Let's start the seed by cleaning our DB."
Movie.destroy_all

puts "Lets start seeding movies to the DB!"
list.each_with_index do |element, index|
  puts "Seeding movie number #{index + 1}..."
  url = "https://api.themoviedb.org/3/movie/#{element}?api_key=#{api_key}&language=en-US"

  movie = JSON.parse(URI.open(url).read)

  new_movie = Movie.new(
    title: movie["original_title"],
    overview: movie["overview"],
    poster_url: "https://image.tmdb.org/t/p/original#{movie["poster_path"]}",
    rating: movie["vote_average"].round(1),
    tagline: movie["tagline"]
  )

  new_movie.save!
  puts "Movie number #{index + 1} saved!"
end

puts "Seeds ran successfully!"
puts "#{list.length} movies saved successfully in the DB! :)"
