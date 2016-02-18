@HomeController = class HomeController
  index: ->
    moviesGallery = new MoviesGallery($ '#movies-gallery')
    moviesGallery.load()
