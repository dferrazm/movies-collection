@MoviePictures = class MoviePictures
  constructor: (@picturesContainer) ->

  load: ->
    @loadPictures()
    @initFileInput()

  initFileInput: ->
    @picturesContainer.find('#file-input').fileupload
      dataType: 'json'
      done: (e, data) => @renderPicture(data.result)

  loadPictures: ->
    moviePictures = @picturesContainer.data('url')
    $.get moviePictures, (pictures) =>
      @renderPicture(picture) for picture in pictures

  renderPicture: (pictureJson) ->
    $picture = $(JST['movies/picture'] pictureJson)
    $picture.find('.icon.destroy').click ->
      $(this).parents('.movie-picture').remove()
    @picturesContainer.append($picture)
