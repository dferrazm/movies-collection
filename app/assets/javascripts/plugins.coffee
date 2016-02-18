$.fn.itemRemovable = ->
  this.find('.btn-remove').click ->
    $(this).parents('.item').remove()
