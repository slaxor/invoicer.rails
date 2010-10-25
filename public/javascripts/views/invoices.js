var InvoicesView = Backbone.View.extend({
  events: {
    "click .name": "handle_details",
    "click .create": "handle_create",
    "click .edit": "handle_edit",
    "click .delete": "handle_delete"
  },
  invoices_collections: {},
  render: function() {
    $('#invoices').html(_.template(invoices_template, invoices))
    this.handleEvents();
    return this;
  },
  handle_details: function(e) {
    invoices.customer_id = $(e.currentTarget).parent().attr('id').match(/(\d+)$/)[1];
    invoices.fetch({success: function(){invoices_view.render();}})
    $(e.currentTarget).siblings('div').toggleClass('hidden');
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
