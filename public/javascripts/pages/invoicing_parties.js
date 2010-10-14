(function($) {
  $.ready(function() {
    $('.invoicing_party').live('click', function(e) {
      $(this).children().toggleClass('hidden');
    })

    $('button#create-invoicing_party').click(function(e) {
      var data = $.harvest_form($('.invoicing_party-form'));
      $.post(location + '/invoicing_parties', data)
    });
  });
})(jQuery);
