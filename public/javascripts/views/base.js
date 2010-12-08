 var BaseView = Backbone.View.extend({
  events: {
    'click .details': 'handle_details',
    'click .invoices': 'handle_invoices',
    'click .edit': 'handle_edit',
    'click .delete': 'handle_delete'
  },

  initialize: function () {
    console.log('base called');
    this.model.view = this;
    this.template = TemplateResolver.get(this.template);
  },
  render: function () {
    $(this.el).append(this.template(this.model.toJSON()) )
    return this;
  },

  handle_details: function () {
    this.$('.details-list').toggleClass('show');
  },
  handle_edit: function (e) {
    new FormView({model: this.model, el: this.form_element, template: this.template + '_form'}).render();
  },
  handle_new: function (e) {
    new FormView({model: this.model, el: this.form_element, template: this.template + '_form'}).render();
  },
});

var FormView = Backbone.View.extend({
  events: {
    'click .ok': 'handle_ok',
    'click .cancel': 'handle_cancel',
    'keypress': 'handle_keypress'
  },

  initialize: function () {
    this.template = TemplateResolver.get(this.template);
  },

  render: function () {
    $(this.el).html(this.template(_.extend(this.model.toJSON(), {isNew: this.model.isNew()})));
    return this;
  },

  handle_ok: function (e) {
    var attributes = this.el.harvest();
    if (this.model.isNew()) {
      this.model.create(attributes);
    } else {
      this.model.set(attributes).save();
    }
    this.disappear();
  },

  handle_cancel: function (e) {
    this.disappear();
  },

  handle_keypress: function (e) {
    switch(e.keyCode) {
      case 13: // enter
        this.$('button.ok').click()
      break;
      case 27: //escape
        this.$('button.cancel').click()
      break;
    }
  },

  disappear: function () {
    $(this.el).html('');
  }
});

