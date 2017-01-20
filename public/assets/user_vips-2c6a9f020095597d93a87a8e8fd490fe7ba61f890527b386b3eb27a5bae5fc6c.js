(function() {
  jQuery(function() {
    var card;
    card = $('#card').val();
    jQuery('#qrcode').qrcode({
      render: 'canvas',
      foreground: "#436EEE",
      width: 100,
      height: 100,
      text: card
    });
  });

}).call(this);
