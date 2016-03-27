import Ember from 'ember';
import ModalWindowMixin from 'frontend/mixins/modal-window';
import { module, test } from 'qunit';

module('Unit | Mixin | modal window');

// Replace this with your real tests.
test('it works', function(assert) {
  let ModalWindowObject = Ember.Object.extend(ModalWindowMixin);
  let subject = ModalWindowObject.create();
  assert.ok(subject);
});
