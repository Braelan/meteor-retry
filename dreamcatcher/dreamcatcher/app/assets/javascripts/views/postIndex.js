DreamCatcher.Views.PostsIndex = Backbone.View.extend({
  template: JST['posts/index'],

  initialize: function(options) {
    this.collection = options.collection
    this.listenTo(this.collection, 'sync' , this.render)
  },

  render: function() {
    var view = this.template({posts: this.collection})
    this.$el.html(view)
    return this;
  }


});
