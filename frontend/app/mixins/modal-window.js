import Ember from 'ember';

export default Ember.Mixin.create({

  actions: {
    onSuccess() {
      //this.hideModal();
      this.sendAction('onSuccess', this.get('fieldsData'));
    },

    onDanger() {
      this.hideModal();
      this.sendAction('onDanger');
    },

    onClose() {
      this.hideModal();
      this.sendAction('onClose');
    }
  },

  hideModal() {
    this.set('showModal', false);
  }

});
