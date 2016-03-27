import Ember from 'ember';
import Notify from '../mixins/notify';

export default Ember.Component.extend(Notify, {

  showStoryModal: false,

  store: Ember.inject.service(),

  errorsMapping: {
    title: 'Story title'
  },

  actions: {
    addStory() {
      var newStory = this.get('store').createRecord('story');

      this.showModal(newStory);
    },

    editStory(story) {
      this.showModal(story);
    },

    saveStory() {
      var story = this.get('story');

      story.set('project', this.get('project'));
      story.save()
        .then(
          this.onSuccess.bind(this),
          this.onError.bind(this)
        );
    },

    onClose() {
      var story = this.get('story');

      if (story.get('id')) {
        story.rollbackAttributes();
      } else {
        story.deleteRecord();
      }

      this.set('showStoryModal', false);
    },

    destroyStory() {
      var story = this.get('story');

      story.destroyRecord()
        .then(
          this.onSuccess.bind(this),
          () => this.showDangerNotify('Error!', 'Story didn\'t destroy!')
        );
    }
  },

  onError(response) {
    var error = response.errors[0];

    this.showDangerNotify(this.errorsMapping[error.field], error.message);
  },

  onSuccess() {
    this.hideModal();
    this.showSuccessNotify('Success!', 'Story saved!');
  },

  showModal(story) {
    this.set('story', story);
    this.set('showStoryModal', true);
  },

  hideModal() {
    this.set('showStoryModal', false);
  }

});
