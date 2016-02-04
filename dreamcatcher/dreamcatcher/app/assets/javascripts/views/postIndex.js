DreamCatcher.Views.PostsIndex = Backbone.CompositeView.extend({
  template: JST['posts/index'],

  initialize: function(options) {
    this.collection = options.collection
    this.listenTo(this.collection, 'sync' , this.render)
  },

  render: function() {
    var view = this.template({posts: this.collection})
    this.$el.html(view)
    this.addPostForm();
    return this;
  },

  addPostForm: function() {
    // persist model after error here
    var postForm = new DreamCatcher.Views.PostForm({collection: this.collection}).render()
    this.attachSubview('.new-form', postForm)
  }




});
