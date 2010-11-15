(function($) {
  $.extend({
    flash: function(message, severity, timeout) {
      timeout = timeout || 2000;
      severity = severity || 'info';
      var box = '<div id="flashmsg" class="' + severity + '">' + message + '</div>';
      $('body').append(box);
      setTimeout(function() {$('#flashmsg').remove()}, timeout);
    }
  });

  $.fn.harvest = function() {
    var form = {};
    this.find('input,select,textarea').each(function(index, el) {
      var $el = $(el);
      if($el.attr('type') === 'checkbox') {
        if($el.is(':checked')) {
          form.hasOwnProperty($el.attr('name')) ? form[$el.attr('name')].push(el.value) : form[$el.attr('name')] = [el.value];
        }
      } else {
        form[$el.attr('name')] = el.value;
      }
    });
    return form;
  }
})(jQuery);
