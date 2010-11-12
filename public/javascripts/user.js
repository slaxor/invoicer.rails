$('#logout').ready(function() {
  $('#logout').click(function(e) {
  	//console.info(e.currentTarget);
    $.ajax({url: '/user_session', type: 'DELETE', success: function() {location = '/'}});
  });
});

