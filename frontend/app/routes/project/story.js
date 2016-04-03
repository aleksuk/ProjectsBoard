import Ember from 'ember';

export default Ember.Route.extend({

  model(params) {
    return Ember.RSVP.hash({
      project: this.modelFor('project'),
      story: this.store.find('story', params.storyId)
    });
  }

});
