$('#logout').ready(function(e) {
  $(e.currentTarget).click(function(e) {
    $.ajax({url: '/user_session', type: 'DELETE', success: function() {location('/')}});
  });
});

