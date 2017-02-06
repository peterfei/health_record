# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
  jQuery ->
    card = $('#card').val()
    jQuery('#qrcode').qrcode
      render: 'canvas'
      foreground: "#436EEE"
      width: 100
      height: 100
      text: card
    return