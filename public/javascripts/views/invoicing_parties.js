var InvoicingPartiesView = Backbone.View.extend({
  events: {
    "click .name": "handle_details",
    "click .create": "handle_create",
    "click .edit": "handle_edit",
    "click .delete": "handle_delete"
  },
  render: function() {
    $('#invoicing_parties').html(_.template(invoicing_parties_template, invoicing_parties))
    //this.handleEvents();
    return this;
  },
  handle_details: function(e) {
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

