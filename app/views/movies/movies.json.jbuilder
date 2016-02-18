json.array! movies do |movie|
  json.id(movie.id)
  json.name(movie.name)
  json.year(movie.year)
  json.pictureUrl(movie.main_picture_url)
end
