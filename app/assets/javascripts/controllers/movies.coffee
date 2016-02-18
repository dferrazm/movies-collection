@MoviesController = class MoviesController
  edit: ->
    picturesInput = new PicturesInputGallery($ '#movie-pictures')
    picturesInput.load()
