import Ember from 'ember';
import Notify from '../mixins/notify';

export default Ember.Component.extend(Notify,{

  tagName: 'section',

  classNames: 'project-editor',

  actions: {
    save() {
      var project = this.get('project');

      project.save()
        .then(
          (project) => {
            this.cleanOldAttachments(project);
            this.get('router').transitionTo('edit-project', project.id);
            this.showSuccessNotify('Success!', 'Project saved');
          },
          this.onError.bind(this)
        );
    },

    destroy() {
      var project = this.get('project');

      project.destroyRecord()
        .then(
          () => { this.navigateToProjects(); },
          () => { this.showDangerNotify('Error!', 'Record didn\'t delete!'); }
        );
    },

    back() {
      var project = this.get('project');

      if (project.get('id')) {
        project.rollbackAttributes();
      } else {
        project.deleteRecord();
      }

      this.navigateToProjects();
    },

    cancel() {
      var project = this.get('project');
      var attachments = project.get('attachments');

      project.rollbackAttributes();
      attachments.forEach((attachment) => {
        if (attachment.get('id')) {
          attachment.rollbackAttributes();
        } else {
          attachments.removeObject(attachment);
          attachment.deleteRecord();
        }
      });
    }
  },

  onError(response) {
    var error = response.errors[0];

    this.showDangerNotify(this.errorsMapping[error.field], error.message);
  },

  navigateToProjects() {
    this.get('router').transitionTo('projects');
  },

  cleanOldAttachments(project) {
    var newAttachments = project.get('attachments').filter((attachment) => {
      return attachment.get('id');
    });

    project.set('attachments', newAttachments);
  }

});
