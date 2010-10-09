$(document).ready(function() {
  $('button#create-customer').click(function(e) {
    $.post('/customers.json',{
      customer: { name: $('input[name="name"]').val() }
    },
    {
      success: function() { console.log('good') },
      error: function() { console.log('bad') }
    },false);
  });
})
