@HomeController = class HomeController
  index: ->
    moviesGallery = new MoviesGallery($('#movies-gallery'), $('#movie_name'))
    moviesGallery.load()
