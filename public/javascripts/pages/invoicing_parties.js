(function($) {
  $(document).ready(function() {
    $('.invoicing_party').live('click', function(e) {
      $(this).children().toggleClass('hidden');
    })

    $('.del-invoicing_party').live('click', function(e) {
      var id = $(this).parent().attr('id').match(/invoicing-party-(\d*)/)[1];
      //$.flash('would call: ' +  "$.delete(location + '/invoicing_parties/'" + id, 'warn', 5000);
      $.del(location + '/invoicing_parties/' + id,  function(){
        $(this).parent().remove();
        $.flash('deleted invoicing party ' + id);
      });
    })

    $('button#create-invoicing_party').click(function(e) {
      var data = $.harvest_form($('.invoicing_party-form'));
      $.post(location + '/invoicing_parties', data, function(){
        $.flash('created a new invoicing party');
      });
    });
  });
})(jQuery);
