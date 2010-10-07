jQuery.ready(function(e) {
  $('#invoice_customer_id').change(function(e) {
    $.get('/customer/1/contacts', {
      success: 'gut',
      error: 'schlecht'
    });
  })
})
