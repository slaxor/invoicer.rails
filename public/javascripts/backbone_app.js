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
    console.log('new Customer:' + json.name);
    console.info(this);
  }
});
var CustomerCollection = Backbone.Collection.extend({
  model: Customer,
  url: location + '/customers'
});

var customers = new CustomerCollection;
//customers.fetch([>{success:function() {console.log(customers.get(1).get('name'))}}<])

var Contact = Backbone.Model.extend({
  initialize: function(json) {
    console.log('new Contact:' + json.name);
    id = json.id;
  }
});
var ContactCollection = Backbone.Collection.extend({
  model: Contact,
  url: location + '/contacts'
});
var contacts = new ContactCollection;
//contacts.fetch({success:function() {console.log(contacts.get(1).get('name'))}})

var InvoicingParty = Backbone.Model.extend({
  initialize: function(json) {
    console.log('new InvoicingParty:' + json.name);
  }
});
var InvoicingPartyCollection = Backbone.Collection.extend({
  model: InvoicingParty,
  url: location + '/invoicing_parties'
});
var invoicing_parties = new InvoicingPartyCollection;
//invoicing_parties.fetch();

var InvoicingParty = Backbone.Model.extend({

  initialize: function(json) {
    console.log('new InvoicingParty:' + json.name);
  }
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
      var data = customers.map(function(m) {
          return m.attributes;
        }).map(function(r,i) {
          return [r.id, r.name, r.number];
      });
      //var data = customers.map(function(customer) {
        //var list_item = _.template(templates.cutomer);
        //console.log(list_item({name: customer.get("name")}));
        //return list_item({name: customer.get("name")});
      $("#customers").html('<ul>' + data + '</ul>');
      return this;
      }
  });

  var customer_view = new CustomerView(/*{el: $('#customers')}*/);
  Backbone.sync();
  //customers.fetch({success: function(){customer_view.render();}});
  setInterval(function(){
    customers.fetch({success: function(){customer_view.render();}});
  },300000)

});
//var data = customers.map(function(m) { return m.attributes; }).map(function(r,i) { return [r.id, r.name, r.number]; });
//var foo = { url:'/users/1/customers', datatype: "json", colNames:['Inv No','Date', 'Client', 'Amount','Tax','Total','Notes'], colModel:[ {name:'id',index:'id', width:55}, {name:'invdate',index:'invdate', width:90}, {name:'name',index:'name asc, invdate', width:100}, {name:'amount',index:'amount', width:80, align:"right"}, {name:'tax',index:'tax', width:80, align:"right"}, {name:'total',index:'total', width:80,align:"right"}, {name:'note',index:'note', width:150, sortable:false} ], rowNum:10, rowList:[10,20,30], pager: '#pager2', sortname: 'id', viewrecords: true, sortorder: "desc", caption:"JSON Example" };