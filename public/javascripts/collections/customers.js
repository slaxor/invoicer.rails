var CustomerCollection = Backbone.Collection.extend({
  model: Customer,
  url: location + '/customers',
  comparator : function (m) { return m.get('name').toLowerCase(); }
});

