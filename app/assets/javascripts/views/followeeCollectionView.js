var App = App || { Models: {}, Collections: {}, Views: {}, Initializer: {}, CurrentUser: {} };

App.Views.FolloweeCollectionView = Backbone.View.extend({
	
	initialize: function(){
		console.log("FolloweeCollectionView initialize");
		this.listenTo(this.collection, 'all', this.render);
	},

	render: function(){
		var self = this;
		this.$el.empty();
		console.log("FolloweeCollectionView is rendering");
		// debugger
		// Note that A Backbone View cannot be passed anything but a Backbone Model
		// Fortunately, at this point, the Collection has been populated with Models
		_.each(this.collection.models, function(model){
			// debugger
			var followeeView = new App.Views.FolloweeView({model: model})
			// debugger
			self.$el.append( followeeView.render().el );
			// debugger
		})
	}

});