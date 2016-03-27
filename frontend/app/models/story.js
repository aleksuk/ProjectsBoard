import DS from 'ember-data';

export default DS.Model.extend({
  title: DS.attr('string', { defaultValue: '' }),
  project: DS.belongsTo('project'),
  tasks: DS.hasMany('task')
});
