//var User = Backbone.Model.extend({
  //initialize: function(json) {
    //console.log('new User:' + json);
  //},
  //url: '/users'
//});
//var UserCollection = Backbone.Collection.extend({
  //model: User,
  //url: '/users'
//});
//var users = new UserCollection;
//users.fetch();

var Customer = Backbone.Model.extend({
  initialize: function(json) {
    //console.log('new Customer:' + json);
  },
  url: location + '/customers'
});
var CustomerCollection = Backbone.Collection.extend({
  model: Customer,
  url: location + '/customers'
});
var customers = new CustomerCollection;
customers.fetch({success:function() {console.log(customers.get(1).get('name'))}})

var InvoicingParty = Backbone.Model.extend({
  initialize: function(json) {
    //console.log('new InvoicingParty:' + json);
  },
  url: location + '/invoicing_parties'
});
var InvoicingPartyCollection = Backbone.Collection.extend({
  model: InvoicingParty,
  url: location + '/invoicing_parties'
});
var invoicing_parties = new InvoicingPartyCollection;
invoicing_parties.fetch();

$(document).ready(function() {
  var CustomerView = Backbone.View.extend({

     //events: { "submit #chatForm" : "handleNewMessage" }

    //, handleNewMessage: function(data) {
      //var inputField = $('input[name=newMessageString]');
      //messages.create({content: inputField.val()});
      //inputField.val('');
    //}

    render: function() {
      var data = customers.map(function(customer) { return customer.get('name') + '\n'});
      var result = data.reduce(function(memo,str) { return memo + str }, '');
      $("#customers").text("name:" + result);
      this.handleEvents();
      return this;
    }

  });

  var customer_view = new CustomerView({el: $('#customers')});

  customers.fetch({success: function(){customer_view.render();}});
  setInterval(function(){
    customers.fetch({success: function(){customer_view.render();}});
  },300000)
});

