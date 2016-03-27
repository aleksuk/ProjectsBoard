import Ember from 'ember';
import NotifyMixin from 'frontend/mixins/notify';
import { module, test } from 'qunit';

module('Unit | Mixin | notify');

// Replace this with your real tests.
test('it works', function(assert) {
  let NotifyObject = Ember.Object.extend(NotifyMixin);
  let subject = NotifyObject.create();
  assert.ok(subject);
});
