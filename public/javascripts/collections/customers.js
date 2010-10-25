var CustomerCollection = Backbone.Collection.extend({
  model: Customer,
  url: location + '/customers'
});

