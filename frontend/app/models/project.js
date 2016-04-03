import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr('string', { defaultValue: '' }),
  description: DS.attr('string', { defaultValue: '' }),
  attachments: DS.hasMany('attachment', { async: true }),
  stories: DS.hasMany('story', { async: true })
});
