$(document).ready(function() {
  $('button#create-customer').click(function(e) {
    var line = $(this).parent();
    $.ajax({
      type: 'POST',
      url: location,
      dataType: 'json',
      data: {customer: {
        'name': $('input[name="name"]').val(),
        'number': $('input[name="number"]').val()
      }},
      success: function(msg){
        line.before('<li>' + msg + '</li>');
      },
      error: function(XMLHttpRequest, textStatus, errorThrown){
        //$.flash(msg.responseText);
        //console.info(msg);
        console.log('unable to create customer');
        console.log(XMLHttpRequest, textStatus, errorThrown);
      }
    });
  });

  $('button.delete').click(function(e) {
    var id = $(this).attr('id').match(/^del-(\d*)/,'')[1];
    var line = $(this).parent();
    console.info(line)
    $.ajax({
      type: "DELETE",
      url: location + '/' + id,
      success: function(XMLHttpRequest, textStatus, errorThrown){
        console.log(XMLHttpRequest, textStatus, errorThrown);
        console.log('delete ' + id);
        line.remove();
      },
      error: function(msg){
        console.log('unable to delete ' + id);
      }
    });
  });
})

