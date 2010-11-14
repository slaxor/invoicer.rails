var ServiceInvoiceItemsView = Backbone.View.extend({
  events: {
    "click .create": "handle_create",
    "click .edit": "handle_edit",
    "click .delete": "handle_delete"
  },
  service_invoice_items_collections: {},
  render: function() {
    $('#service-invoice-items').html(_.template(service_invoice_items_template, service_invoice_items))
    //this.handleEvents();
    return this;
  },

  handle_create: function(e) {
    console.log($(e.currentTarget));
  },
  handle_edit: function(e) {
    console.log($(e.currentTarget).parent().attr('id').match(/(\d+)$/)[1]);
  },
  handle_delete: function(e) {
    console.log(e);
  }
});

