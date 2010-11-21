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
      'click #new-customer': 'new_customer'
    },
    initialize: function () {
      _.bindAll(this, 'render');
      var customers = new CustomerCollection;
      customers.bind('refresh', _.bind(this.add_customers, this, customers));
      customers.fetch();
    },
    add_customer: function ($ul, customer) {
      var view = new CustomerView({model: customer});
      $ul.append(view.render().el);
    },
    add_customers: function (customers) {
      var $customers = $('#customers');
      //$('body').append('<div id="customer-form" class="window">');
      if (customers.length) {
        var $ul = $('<ul>').appendTo($('#customers'));
        customers.each(_.bind(this.add_customer, this, $ul));
      }
    },
    new_customer: function (e) {
      console.log('new customer');
      new CustomerFormView({model: new Customer, el: $('#customer-form')}).render();
    }
  });
  new AppView();
  //invoicing_parties_view = new InvoicingPartiesView({el: $('#invoicing_parties')});
  //invoices_view = new InvoicesView({el: $('#invoices')});
  //service_invoice_items_view = new ServiceInvoiceItemsView({el: $('#service_invoice_items-' + service_invoice_items.invoice_id)});
  //invoicing_parties.fetch({success: function (){invoicing_parties_view.render();}});
  //$('.window').live('ready', function (e) {console.info(this);$(this).draggable();});
  //setInterval(function (){
    //customers.fetch({success: function (){customers_view.render();}});
    //invoicing_parties.fetch({success: function (){invoicing_parties_view.render();}});
  //},300000)
});

