window.DreamCatcher = {
  Collections: {},
  Models: {},
  Views: {},
  Routers: {},

  initialize: function() {
    DreamCatcher.Posts = new DreamCatcher.Collections.Posts();
    DreamCatcher.Posts.fetch({
      success: function(data) {

        console.log('fetched collection')
      },
      error: function() {
        console.log('dreamcatcher.js collection not fetched')
      }
    }
  )
    new DreamCatcher.Routers.Router({$rootEl: $('div')});
    Backbone.history.start();
    console.log("DreamCatcher.js online")
  }


}
