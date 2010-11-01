var get_template = function(template) {
  var t = $.ajax({url: '/javascripts/templates/_' + template + '.html', type: 'GET', async: false});
  return t.responseText;
}

var customers = new CustomerCollection;
var invoicing_parties = new InvoicingPartyCollection;
var invoices = new InvoiceCollection;
var service_invoice_items = new ServiceInvoiceItemCollection;
var customers_template = get_template('customers');
var invoicing_parties_template = get_template('invoicing_parties');
var invoices_template = get_template('invoices');
var service_invoice_items_template = get_template('service_invoice_items');
var customers_view, invoicing_parties_view, invoices_view, service_invoice_items_view;
$(document).ready(function() {
  customers_view = new CustomersView({el: $('#customers')});
  invoicing_parties_view = new InvoicingPartiesView({el: $('#invoicing_parties')});
  invoices_view = new InvoicesView({el: $('#invoices')});
  service_invoice_items_view = new ServiceInvoiceItemsView({el: $('#service_invoice_items-' + service_invoice_items.invoice_id)});
  customers.fetch({success: function(){customers_view.render();}});
  invoicing_parties.fetch({success: function(){invoicing_parties_view.render();}});
  //$('.window').live('ready', function(e) {console.info(this);$(this).draggable();});
  //setInterval(function(){
    //customers.fetch({success: function(){customers_view.render();}});
    //invoicing_parties.fetch({success: function(){invoicing_parties_view.render();}});
  //},300000)
});

