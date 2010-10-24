var Customer = Backbone.Model.extend({
});

var CustomerCollection = Backbone.Collection.extend({
  model: Customer,
  url: location + '/customers'
});

var customers = new CustomerCollection;


var Contact = Backbone.Model.extend({
});

var ContactCollection = Backbone.Collection.extend({
  model: Contact,
  url: location + '/contacts'
});

var contacts = new ContactCollection;
//contacts.fetch({success:function() {console.log(contacts.get(1).get('name'))}})


var InvoicingParty = Backbone.Model.extend({
});

var InvoicingPartyCollection = Backbone.Collection.extend({
  model: InvoicingParty,
  url: location + '/invoicing_parties'
});

var invoicing_parties = new InvoicingPartyCollection;

var Invoice = Backbone.Model.extend({
});
//var InvoiceCollection = Backbone.Collection.extend({
  //model: Invoice,
  //url: location + '/invoices'
//});
//var invoices = new InvoiceCollection;
//invoices.fetch();
var customers_template = $.get('/_customers_template.html')
var invoicing_parties_template = $.get('/_invoicing_parties_template.html')
$(document).ready(function() {
  var CustomerView = Backbone.View.extend({
    render: function() {
      $('#customers').html(_.template(customers_template.responseText, customers))
      return this;
    }
  });

  var InvoicingPartyView = Backbone.View.extend({
    events: {
      "click .name": "handle_details",
      "click .create": "handle_create",
      "click .edit": "handle_edit",
      "click .delete": "handle_delete"
    },
    render: function() {
      $('#invoicing_parties').html(_.template(invoicing_parties_template.responseText, invoicing_parties))
      this.handleEvents();
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

  var customer_view = new CustomerView({el: $('#customers')});
  var invoicing_party_view = new InvoicingPartyView({el: $('#invoicing_parties')});

  customers.fetch({success: function(){customer_view.render();}});
  invoicing_parties.fetch({success: function(){invoicing_party_view.render();}});
  setInterval(function(){
    customers.fetch({success: function(){customer_view.render();}});
    invoicing_parties.fetch({success: function(){invoicing_party_view.render();}});
  },300000)

});

