var ServiceInvoiceItemCollection = Backbone.Collection.extend({
  model: ServiceInvoiceItem,
  url: function() {
    return location + '/customers/' + invoices.customer_id + '/invoices/' + this.invoice_id + '/service_invoice_items';
  }
});

