import Ember from 'ember';

export default Ember.Component.extend({

  tagName: 'li',

  classNames: 'list-group-item',

  actions: {
    editStory() {
      //this.get('parentView').send('editStory', this.get('story'));
      this.sendAction('onEdit', this.get('story'));
    }
  }

});
