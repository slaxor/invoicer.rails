var TemplateResolver = (function () {
  var get_template = function (template) {
    var t = $.ajax({url: '/javascripts/templates/_' + template + '.html', type: 'GET', async: false});
    return _.template(t.responseText);
  };
  var template_names = ['customer', 'invoicing_party', 'invoice', 'service_invoice_item',
    'invoicing_party', 'customer_form', 'invoice_form' // ...
    ];
  var templates = _.reduce(template_names, function (memo, name) {
    memo[name] = get_template(name);
    return memo;
  }, {});
  return {
    get: function (name) {
      return templates[name] || (function () { throw 'No such template ' + name; })();
    }
  };
})();

var invoicing_parties = new InvoicingPartyCollection;
var invoices = new InvoiceCollection;
var service_invoice_items = new ServiceInvoiceItemCollection;

$(document).ready(function () {
  var AppView = Backbone.View.extend({
    events: {
      'click #new-customer': 'new_customer',
      'click #new-invoicing-party': 'new_invoicing_party'
    },
    initialize: function () {
      _.bindAll(this, 'render');
      var customers = new CustomerCollection;
      customers.bind('refresh', _.bind(this.add_customers, this, customers));
      customers.fetch();
      var invoicing_parties = new InvoicingPartyCollection;
      invoicing_parties.bind('refresh', _.bind(this.add_invoicing_parties, this, invoicing_parties));
      invoicing_parties.fetch();
    },
    add_customer: function ($ul, customer) {
      var view = new CustomerView({model: customer});
      $ul.append(view.render().el);
    },
    add_customers: function (customers) {
      var $customers = $('#customers');
      if (customers.length) {
        var $ul = $('<ul>').appendTo($('#customers'));
        customers.each(_.bind(this.add_customer, this, $ul));
      }
    },
    add_invoicing_party: function ($ul, invoicing_party) {
      var view = new InvoicingPartyView({model: invoicing_party});
      $ul.append(view.render().el);
    },
    add_invoicing_parties: function (invoicing_parties) {
      var $invoicing_parties = $('#invoicing-parties');
      if (invoicing_parties.length) {
        var $ul = $('<ul>').appendTo($('#invoicing_parties'));
        invoicing_parties.each(_.bind(this.add_invoicing_party, this, $ul));
      }
    },
    new_customer: function (e) {
      new CustomerFormView({model: new Customer, el: $('#customer-form')}).render();
    },
    new_invoicing_party: function (e) {
      new InvoicingPartyFormView({model: new InvoicingParty, el: $('#invoicing-party-form')}).render();
    }
  });
  new AppView();
});

