var App = App || { Models: {}, Collections: {}, Views: {}, Initializer: {} };

console.log("STARTING to read FolloweeView.js")

App.Views.FolloweeView = Backbone.View.extend({
	initialize: function(){
		// this listens for a crUUUUd (i.e. update) operation
		console.log("FolloweeView init");
		this.listenTo(this.model, "change", this.render);
		this.listenTo(this.model, "destroy", this.remove);
	},

	tagName: 'li',
	// template: function(){
	// 	console.log("article view template is called");
	// 	return _.template( $('#saved_articles_template').html() );
	// },
	events: {
		'click button[name="delete_comment"]': 'removeComment'
	},

	template: function() { 
		return _.template( $('#followee_template').html() )
	},

	render: function(){
		console.log("FollowView rendering");		
		this.$el.empty();
		this.$el.html(this.template()(this.model.attributes));

		return this;
	},

	removeArticle: function(){
		this.model.destroy();

		return this;
	}	
});

console.log("finished reading FolloweeView.js");