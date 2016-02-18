@ItemsGallery = class ItemsGallery
  constructor: (@galleryContainer, @itemTemplate) ->

  load: ->
    itemsUrl = @galleryContainer.data('url')
    $.get itemsUrl, (items) =>
      @renderItem(item) for item in items
      @afterItemsRendered()

  renderItem: (item) ->
    $item = $(JST[@itemTemplate] item)
    $item.itemRemovable()
    @galleryContainer.append($item)

  afterItemsRendered: -> return
