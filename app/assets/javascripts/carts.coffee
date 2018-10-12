$(document).on "turbolinks:load", ->
  $('#remove-cart').click (e) ->
    e.preventDefault()
    $this = $(this)
    url = $this.data('targeturl')
    console.log(url)
    $.ajax url: url, type: 'put', success: (data) ->

      $('.cart-count').html(data)
