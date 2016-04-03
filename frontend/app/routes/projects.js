import Ember from 'ember';

export default Ember.Route.extend({

  queryParams: {
    page: {
      refreshModel: true
    }
  },

  model(params, transition) {
    return this.store.query('project', { page: transition.queryParams.page || 1 });
  }

});
