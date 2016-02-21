@MoviesGallery = class MoviesGallery extends PaginatedItemsGallery
  constructor: (container, addMovieField) ->
    super container, 'gallery/movie'
    @addMovieField = addMovieField

  afterItemsRendered: ->
    super
    if @isGalleryEmpty()
      @renderEmptyPlaceholder()
      @focusAddMovieField()

  renderEmptyPlaceholder: ->
    @galleryContainer.append(JST['gallery/empty_message']())

  isGalleryEmpty: ->
    @galleryContainer.html().trim() == ""

  focusAddMovieField: ->
    @addMovieField.focus()
