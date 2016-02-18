$.fn.itemRemovable = ->
  this.find('.icon-remove').click ->
    $(this).parents('.item').remove()
