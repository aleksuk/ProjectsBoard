import Ember from 'ember';

export function cleanProp(params/*, hash*/) {
  var model = params[0];
  var prop = params[1];
  var isDirty = params[2];
  var changedAttributes = model.changedAttributes();
  var result;

  if (isDirty && changedAttributes[prop]) {
    result = changedAttributes[prop][0];
  } else {
    result = model.get(prop);
  }

  return result;
}

export default Ember.Helper.helper(cleanProp);
