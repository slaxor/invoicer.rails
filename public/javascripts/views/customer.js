 var CustomerView = Backbone.View.extend({
  events: {
    'click .details': 'handle_details',
    'click .invoices': 'handle_invoices',
    'click .edit': 'handle_edit',
    'click .delete': 'handle_delete'
  },
  initialize: function() {
    this.model.view = this;
    this.template = TemplateResolver.get('customer');
  },
  render: function() {
    $(this.el).append(this.template(this.model.toJSON()) )
    return this;
  },

  get_customer_id: function(e) {console.info(e) ; return $(e.currentTarget).parent().attr('id').match(/(\d+)$/)[1];},

  handle_details: function () {
    this.$('.details-list').toggleClass('show');
  },

  handle_invoices: function(e) {
    var customer_id = this.get_customer_id(e);
    if(invoices.customer_id !== customer_id) {
      invoices.customer_id = customer_id;
      invoices.fetch({success: function(){invoices_view.render();}});
    }
  },
  handle_edit: function(e) {
    new CustomerFormView({model: this.model}).render();
  },
  handle_new: function(e) {
    new CustomerFormView({model: this.model}).render();
  },
});



var CustomerFormView = Backbone.View.extend({
  events: {
    'click .ok': 'handle_ok',
    'click .cancel': 'handle_cancel'
  },

  initialize: function() {
    _.bindAll(this, 'handle_ok', 'handle_cancel');
    this.el = $('#customer-form');
    this.template = TemplateResolver.get('customer_form');
  },

  render: function() {
    $(this.el).html(this.template(_.extend(this.model.toJSON(), {isNew: this.model.isNew()})));
    return this;
  },

  handle_ok: function(e) {
    var attributes = $(this.el).harvest();
    if (this.model.isNew()) {
      this.model.set(attributes).save();
    } else {
      this.model.create(attributes);
    }
    this.disappear();
  },

  handle_cancel: function(e) {
    console.log('clicked cancel');
    this.disappear();
  },

  disappear: function () {
    $(this.el).html('');
  }
});

