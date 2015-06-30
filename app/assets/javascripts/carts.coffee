$ ->
  $("a[data-product]").on "ajax:success", (e, data, status, xhr) ->
    if data == 0
      $(this).closest('tr').remove()
    else
      productId = $(this).data('product')
      tagId = "#value_product_".concat(productId)
      $(tagId).text(data)
