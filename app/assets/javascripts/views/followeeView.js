var App = App || { Models: {}, Collections: {}, Views: {}, Initializer: {} };

console.log("STARTING to read FolloweeView.js")

App.Views.FolloweeView = Backbone.View.extend({
	initialize: function(){
		// this listens for a crUUUUd (i.e. update) operation
		console.log("FolloweeView init");
		this.listenTo(this.model, "change", this.render);
		this.listenTo(this.model, "destroy", this.remove);
	},

	events: {
		'click button[data-action="delete"]': 'deleteFollowee',
		'click button[data-action="reading"]': 'readingAction'

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

	deleteFollowee: function(){
		this.model.destroy();

		return this;
	},

	readingAction: function(){
		
	}

});

console.log("finished reading FolloweeView.js");