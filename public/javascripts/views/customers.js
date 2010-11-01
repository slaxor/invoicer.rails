var CustomersView = Backbone.View.extend({
  events: {
    'click .details': 'handle_details',
    'click .invoices': 'handle_invoices',
    'click .create': 'handle_create',
    'click .edit': 'handle_edit',
    'click .delete': 'handle_delete',
    'click .ok': 'handle_ok',
    'click .cancel': 'handle_cancel'
  },
  render: function() {
    $('#customers').html(_.template(customers_template, customers))
    this.handleEvents();
    return this;
  },

  get_id: function(e) {return $(e.currentTarget).parent().attr('id').match(/(\d+)$/)[1];},

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
    this.form = this.form || get_template('customer_form');
    var $customer_form = $('#customer-form').html(_.template(this.form, {m: customers.add().last()}));
  },
  handle_edit: function(e) {
    var id = $(e.currentTarget).parent().attr('id').match(/(\d+)$/)[1];
    this.form = this.form || get_template('customer_form');
    var $customer_form = $('#customer-form').html(_.template(this.form, {m: customers.get(id)}));
  },
  handle_delete: function(e) {
    customers.get(this.get_id(e)).destroy();
  },
  handle_ok: function(e) {
    var attributes = $(e.currentTarget).parent().harvest();
    if (id = attributes.id) {
      customers.get(id).set(attributes).save();
    } else {
      customers.create(attributes);
    }
    $('#customer-form').html('');
  },
  handle_cancel: function(e) {
    $('#customer-form').html('');
  }
});

