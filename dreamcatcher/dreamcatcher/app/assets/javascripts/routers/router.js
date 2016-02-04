DreamCatcher.Routers.Router = Backbone.Router.extend({
  routes: {
    "": "index",
  },

  initialize: function(options) {
    this.$rootEl = options.$rootEl;
    this.collection = DreamCatcher.Posts;
  },

  index: function() {
    var view = new DreamCatcher.Views.PostsIndex({ collection: this.collection })
    this._swapview(view);
  },

  _swapview: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el)
  },


});
