@PaginatedItemsGallery = class PaginatedItemsGallery extends ItemsGallery
  constructor: ->
    super
    @perPage = @galleryContainer.data('per-page')
    @currentPage = 1

  itemsUrl: ->
    url = @galleryContainer.data('url')
    "#{url}?count=#{@perPage}&offset=#{@currentOffset()}"

  currentOffset: ->
    (@currentPage - 1) * @perPage

  afterItemsRendered: (renderedItems) ->
    if renderedItems.length < @perPage
      @hideLoadMoreButton()
    else
      @showLoadMoreButton()
      @currentPage += 1

  showLoadMoreButton: ->
    unless @loadMore
      @loadMore = $ JST['gallery/load_more']()
      @loadMore.click => @load()
      @galleryContainer.after(@loadMore)

  hideLoadMoreButton: ->
    @loadMore.hide() if @loadMore
