var Invoice = Backbone.Model.extend({
  initialize: function() {
    if(this.paid) {
      this.attributes['status'] = 'paid';
    } else {
      if(Date.parse(this.due) < new Date) {
       this.attributes['status'] = 'overdue';
      } else {
       this.attributes['status'] = 'unpaid';
      }
    }
  }
});

