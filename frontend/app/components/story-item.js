import Ember from 'ember';

export default Ember.Component.extend({

  tagName: 'li',

  classNames: 'list-group-item',

  actions: {
    editStory() {
      this.sendAction('onEdit', this.get('story'));
    }
  }

});
