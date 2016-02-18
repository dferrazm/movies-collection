@PicturesInputGallery = class PicturesInputGallery extends ItemsGallery
  constructor: (@container) ->
    super @container, 'movies/picture'

  load: ->
    super
    @initFileInput()

  initFileInput: ->
    @container.find('#file-input').fileupload
      dataType: 'json'
      done: (e, data) => @renderItem(data.result)
