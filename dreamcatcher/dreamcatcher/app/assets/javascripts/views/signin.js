DreamCatcher.Views.SignIn = Backbone.View.extend({
  template: JST['signin/signin'],
  events: {
    "click .sign-out" : "sign_out",
    "click .sign-up" : "sign_up",
    "click .sign-in" : "sign_in"
  },

  initialize: function(options) {
    this.current_user = options.model
    this.listenTo(this.current_user, 'sync', this.render)
  },

  render: function(){
    var view = this.template({current_user : this.current_user})
    this.$el.html(view)
    return this;
  },

  sign_in: function(event) {
    event.preventDefault()
    var that = this;
    var attrs = $('.sign-in-form').serializeJSON()
    $.ajax({
      url: "session",
      method: "POST",
      data: attrs,
      success: function() {
        that.current_user.fetch()
      }
    })
  },

  sign_out: function(event) {
    event.preventDefault();
    var that = this;
    $.ajax({
      url: '/session',
      data: { _method: 'delete'},
      type: "POST",
      success: function() {
        console.log("set")
        that.current_user = new DreamCatcher.Models.CurrentUser()
        that.current_user.fetch();
        that.render();
      }
    }
    )
  },

  sign_up: function(event){
    event.preventDefault()
    var that = this;
    var attrs = $('.sign-up-form').serializeJSON();
    debugger
    $.ajax({
      url: 'api/users',
      method: "POST",
      data: attrs,
      success: function(){
        that.current_user.fetch();
      }
    })
  }




})
