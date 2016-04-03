import Ember from 'ember';

export default Ember.Component.extend({

  tagName: 'li',

  classNames: 'attachment-item',

  actions: {
    deleteAttachment() {
      this.sendAction('onDelete', this.get('attachment'));
    }
  }

});
