import Ember from 'ember';

export default Ember.Mixin.create({

  notify: null,

  showAlertNotify: false,

  showNotify(notify) {
    const notifyTimeout = 5000;

    this.set('showAlertNotify', true);
    this.set('notify', notify);

    setTimeout(this.hideNotify.bind(this), notifyTimeout);
  },

  hideNotify() {
    if (!this.isDestroyed) {
      this.set('showAlertNotify', false);
    }
  },

  showDangerNotify(strong, message) {
    this.showNotify({
      type: 'danger',
      strong: strong,
      message: message
    });
  },

  showInfoNotify(strong, message) {
    this.showNotify({
      type: 'info',
      strong: strong,
      message: message
    });
  },

  showWarningNotify(strong, message) {
    this.showNotify({
      type: 'warning',
      strong: strong,
      message: message
    });
  },

  showSuccessNotify(strong, message) {
    this.showNotify({
      type: 'success',
      strong: strong,
      message: message
    });
  }

});
