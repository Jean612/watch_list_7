require 'open-uri'
require 'json'

puts 'creando pelis'

url_top_rated = 'http://tmdb.lewagon.com/movie/top_rated'
url_now_playing = 'http://tmdb.lewagon.com/movie/now_playing'
url_popular = 'http://tmdb.lewagon.com/movie/popular'

top_rated = JSON.parse(URI.open(url_top_rated).read)
now_playing = JSON.parse(URI.open(url_now_playing).read)
popular = JSON.parse(URI.open(url_popular).read)

top_rated['results'].each do |movie|
  if Movie.where(title: movie['title']).count == 0
    Movie.create(
      title: movie['title'],
      overview: movie['overview'],
      poster_url: "https://image.tmdb.org/t/p/original#{movie['poster_path']}",
      rating: movie['vote_average']
    )
  end
end

now_playing['results'].each do |movie|
  if Movie.where(title: movie['title']).count == 0
    Movie.create(
      title: movie['title'],
      overview: movie['overview'],
      poster_url: "https://image.tmdb.org/t/p/original#{movie['poster_path']}",
      rating: movie['vote_average']
    )
  end
end

popular['results'].each do |movie|
  if Movie.where(title: movie['title']).count == 0
    Movie.create(
      title: movie['title'],
      overview: movie['overview'],
      poster_url: "https://image.tmdb.org/t/p/original#{movie['poster_path']}",
      rating: movie['vote_average']
    )
  end
end

puts 'pelis creadas'
