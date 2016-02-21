@ItemsGallery = class ItemsGallery
  constructor: (@galleryContainer, @itemTemplate) ->

  load: ->
    $.get @itemsUrl(), (items) =>
      @renderItem(item) for item in items
      @afterItemsRendered(items)

  itemsUrl: ->
    @galleryContainer.data('url')

  renderItem: (item) ->
    $item = $(JST[@itemTemplate] item)
    $item.itemRemovable()
    @galleryContainer.append($item)

  afterItemsRendered: -> return
