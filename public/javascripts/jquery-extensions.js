(function($) {
  $.extend({
    harvest_form: function(selectors) {
      var form = {}
      $.each(selectors, function(i,s) {form[$(s).attr('name')] = s.value;})
      return form;
    },

    flash: function(message, severity, timeout) {
      timeout = timeout || 2000;
      severity = severity || 'info';
      var box = '<div id="flashmsg" class="' + severity + '">' + message + '</div>';
      $('body').append(box);
      setTimeout(function() {$('#flashmsg').remove()}, timeout);

    }
  })
})(jQuery);
