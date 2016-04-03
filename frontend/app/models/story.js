import DS from 'ember-data';

export default DS.Model.extend({
  title: DS.attr('string', { defaultValue: '' }),
  project: DS.belongsTo('project', { async: true }),
  tasks: DS.hasMany('task', { async: true })
});
