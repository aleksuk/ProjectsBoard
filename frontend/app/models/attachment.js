import DS from 'ember-data';

export default DS.Model.extend({
  link: DS.attr('string'),
  name: DS.attr('string'),
  project: DS.belongsTo('project')
});
