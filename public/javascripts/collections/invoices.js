var InvoiceCollection = Backbone.Collection.extend({
  model: Invoice,
  url: function() {
    return location + '/customers/' + this.customer_id + '/invoices';
  }
});

