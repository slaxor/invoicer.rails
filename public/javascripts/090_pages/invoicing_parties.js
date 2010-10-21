(function($) {
  $(document).ready(function() {
    $('.invoicing_party').live('click', function(e) {
      $(this).children().toggleClass('hidden');
    })

    $('.del-invoicing_party').live('click', function(e) {
      var $li = $(this).parent()
      var id = $li.attr('id').match(/invoicing-party-(\d*)/)[1];
      $.del(location + '/invoicing_parties/' + id,  function(e){
        console.info($li);
        $li.remove();
        $.flash('deleted invoicing party ' + id);
      });
      return false;
    })

    $('button#create-invoicing_party').click(function(e) {
      var data = $.harvest_form($('.invoicing_party-form'));
      $.post(location + '/invoicing_parties', data, function(json){
        $.flash('created a new invoicing party');
        var li = '<li id="invoicing-party-' + json.invoicing_party.id  + '" class="invoicing_party">' + json.invoicing_party.name;
        li += '<span class="del-invoicing_party">X</span>';
        li += '<div class="hidden">';
        li += '</li>';
        $(e.currentTarget).parent().siblings(':last').append(li);
      });
    });
  });
})(jQuery);
