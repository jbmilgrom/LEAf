var App = App || { Models: {}, Collections: {}, Views: {}, Initializer: {} };

console.log("STARTING to read FollowerView.js")

App.Views.FollowerView = Backbone.View.extend({
	initialize: function(){
		// this listens for a crUUUUd (i.e. update) operation
		console.log("FollowerView init");
		this.listenTo(this.model, "change", this.render);
		this.listenTo(this.model, "destroy", this.remove);
	},

	tagName: 'li',

	events: {
		'click button[data-action="delete"]': 'deleteFollower'
	},

	template: function() { 
		return _.template( $('#follower_template').html() )
	},

	render: function(){
		console.log("FollowView rendering");		
		this.$el.empty();
		this.$el.html(this.template()(this.model.attributes));

		return this;
	},

	deleteFollower: function(){
		this.model.destroy();

		return this;
	}	
});

console.log("finished reading FollowerView.js");