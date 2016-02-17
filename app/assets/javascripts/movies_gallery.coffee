@MoviesGallery = class MoviesGallery
  constructor: (@gallery) ->

  load: ->
    $.get '/movies/recents', (movies) =>
      @renderMovies(movies)

  renderMovies: (movies) ->
    @gallery.append(movies)
