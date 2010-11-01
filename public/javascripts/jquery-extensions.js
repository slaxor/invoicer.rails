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
    this.children('input|option').each(function(index, el) {
      form[$(el).attr('name')] = el.value
    });
    return form
  }
})(jQuery);
