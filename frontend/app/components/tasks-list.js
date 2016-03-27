import Ember from 'ember';
import Notify from '../mixins/notify';

export default Ember.Component.extend(Notify, {

  showTaskModal: false,

  store: Ember.inject.service(),

  errorsMapping: {
    body: 'Task title'
  },

  actions: {
    addTask() {
      var newTask = this.get('store').createRecord('task');

      this.showModal(newTask);
    },

    editTask(task) {
      this.showModal(task);
    },

    saveTask(data) {
      var task = this.get('task');

      task.set('story', this.get('story'));
      task.save(data)
        .then(
          this.onSuccess.bind(this),
          this.onError.bind(this)
        );
    },

    onClose() {
      var task = this.get('task');

      if (task.get('id')) {
        task.rollbackAttributes();
      } else {
        task.deleteRecord();
      }

      this.hideModal();
    },

    destroyTask() {
      var task = this.get('task');

      task.destroyRecord()
        .then(
          this.onSuccess.bind(this),
          () => this.showDangerNotify('Error!', 'Task wasn\'t destroyed!')
        );
    }
  },

  onError(response) {
    var error = response.errors[0];

    this.showDangerNotify(this.errorsMapping[error.field], error.message);
  },

  onSuccess() {
    this.hideModal();
    this.showSuccessNotify('Success!', 'Task saved!');
  },

  showModal(task) {
    this.set('task', task);
    this.set('showTaskModal', true);
  },

  hideModal() {
    this.set('showTaskModal', false);
  }

});
