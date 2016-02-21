@MoviesGallery = class MoviesGallery extends ItemsGallery
  constructor: (container) ->
    super container, 'gallery/movie'

  afterItemsRendered: ->
    if @isGalleryEmpty()
      @renderEmptyPlaceholder()
      @focusOnAddMovieField()

  renderEmptyPlaceholder: ->
    @galleryContainer.append(JST['gallery/empty_message']())

  isGalleryEmpty: ->
    @galleryContainer.html().trim() == ""

  focusOnAddMovieField: ->
    $('#movie_name').focus()
