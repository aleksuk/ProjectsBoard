import Ember from 'ember';

export default Ember.Component.extend({

  tagName: 'li',

  classNames: 'list-group-item',

  actions: {
    editTask() {
      this.sendAction('onEdit', this.get('task'));
    }
  }

});
