import Ember from 'ember';

export default Ember.Component.extend({

  store: Ember.inject.service(),

  classNames: 'project-attachments-editor',

  attachmentName: '',

  attachmentLink: '',

  actions: {
    addAttachment() {
      var attachment = this.get('store').createRecord('attachment', {
        name: this.get('attachmentName'),
        link: this.get('attachmentLink')
      });

      this.get('attachments').pushObject(attachment);
      this.clearFields();
    },

    deleteAttachment(attachment) {
      this.get('attachments').removeObject(attachment);
    }
  },

  clearFields() {
    this.set('attachmentName', '');
    this.set('attachmentLink', '');
  }

});
