import Ember from 'ember';

export default Ember.Component.extend({
  actions: {
    destroy() {
      this.get('project').destroyRecord();
    }
  }
});
