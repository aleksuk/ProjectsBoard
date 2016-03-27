import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('projects');
  this.route('project', { path: '/projects/:projectId' }, function () {
    this.route('stories');
    this.route('story', { path: '/stories/:storyId' });
  });
  this.route('new-project');

  this.route('edit-project', { path: '/edit-project/:projectId' });
});

export default Router;
