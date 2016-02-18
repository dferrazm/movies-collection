@MoviesGallery = class MoviesGallery
  constructor: (@gallery) ->

  load: ->
    moviesUrl = @gallery.data('url')
    $.get moviesUrl, (movies) => @renderMovies(movies)

  renderMovies: (movies) ->
    @gallery.append(movies)
