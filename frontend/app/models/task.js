import DS from 'ember-data';

export default DS.Model.extend({
  body: DS.attr('string', { defaultValue: '' }),
  hours: DS.attr('number'),
  story: DS.belongsTo('story', { async: true })
});
