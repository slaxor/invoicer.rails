var CustomersView = Backbone.View.extend({
  events: {
    "click .details": "handle_details",
    "click .invoices": "handle_invoices",
    "click .create": "handle_create",
    "click .edit": "handle_edit",
    "click .delete": "handle_delete"
  },
  render: function() {
    $('#customers').html(_.template(customers_template, customers))
    this.handleEvents();
    return this;
  },
  handle_details: function(e) {
    $(e.currentTarget).siblings('.details-list').toggleClass('show');
  },
  handle_invoices: function(e) {
    var customer_id = $(e.currentTarget).parent().attr('id').match(/(\d+)$/)[1];
    if(invoices.customer_id !== customer_id) {
      invoices.customer_id = customer_id;
      invoices.fetch({success: function(){invoices_view.render();}});
    }
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

