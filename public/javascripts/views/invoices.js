var InvoicesView = Backbone.View.extend({
  events: {
    'click .name': 'handle_details',
    'click .create': 'handle_create',
    'click .edit': 'handle_edit',
    'click .delete': 'handle_delete',
    'click .delete': 'handle_delete',
    'click .ok': 'handle_ok',
    'click .cancel': 'handle_cancel'
  },
  get_invoice_id: function(e) {return $(e.currentTarget).parent().attr('id').match(/(\d+)$/)[1];},
  invoices_collections: {},

  render: function() {
    $('#invoices').html(_.template(invoices_template, invoices))
    //this.handleEvents();
    return this;
  },
  handle_details: function(e) {
    var invoice_id = this.get_invoice_id(e);
    if(service_invoice_items.invoice_id !== invoice_id) {
      service_invoice_items.invoice_id = invoice_id;
      service_invoice_items.fetch({success: function(){service_invoice_items_view.render();}});
    }
    $(e.currentTarget).siblings('div').toggleClass('show');
  },
  handle_create: function(e) {
    this.form = this.form || get_template('invoice_form');
    var $invoice_form = $('#invoice-form').html(_.template(this.form, {m: invoices.add().last()}));
    $invoice_form.find('due_on').datepicker({dateFormat: 'yy-mm-dd'});
    $invoice_form.find('printed_at').datepicker();
  },
  handle_edit: function(e) {
    this.form = this.form || get_template('invoice_form');
    var $invoice_form = $('#invoice-form').html(_.template(this.form, {m: invoices.get(this.get_invoice_id(e))}));
  },
  handle_delete: function(e) {
    invoices.get(this.get_invoice_id(e)).destroy();
  },
  handle_ok: function(e) {
    var attributes = $(e.currentTarget).parent().harvest();
    if (id = attributes.id) {
      invoices.get(id).set(attributes).save();
    } else {
      invoices.create(attributes);
    }
    $('#invoice-form').html('');
  },
  handle_cancel: function(e) {
    $('#invoice-form').html('');
  }
});
