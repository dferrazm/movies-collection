@MoviesController = class MoviesController
  edit: ->
    moviePictures = new MoviePictures($ '#movie-pictures')
    moviePictures.load()
