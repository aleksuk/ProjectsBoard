import Ember from 'ember';

export default Ember.Component.extend({

  tagName: 'nav',

  classNames: 'pages-pagination',

  siblingPages: [1, 2, 3, 4, 5],

  didReceiveAttrs() {
    this._super(...arguments);

    var pages = this.get('pages');
    var siblingPages = this.get('siblingPages');
    var prevPages = [];
    var nextPages = [];

    siblingPages.forEach((page) => {
      let prevPage = pages.currentPage - page;
      let nextPage = pages.currentPage + page;

      if (prevPage > 0) {
        prevPages.unshift(prevPage);
      }

      if (pages.totalPages - nextPage >= 0) {
        nextPages.push(nextPage);
      }
    });

    this.set('pagesList', prevPages.concat(0, nextPages));
  }

});
