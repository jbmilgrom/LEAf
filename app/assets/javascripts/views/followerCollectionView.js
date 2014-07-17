var App = App || { Models: {}, Collections: {}, Views: {}, Initializer: {} };

App.Views.FollowerCollectionView = Backbone.View.extend({
	
	initialize: function(){
		console.log("FollowerCollectionView initialize");
		this.listenTo(this.collection, 'all', this.render);
	},

	render: function(){
		var self = this;
		
		this.$el.empty();
		console.log("FollowerCollectionView is rendering");	
		
		_.each(this.collection.models, function(model){
			
			var followerView = new App.Views.FollowerView({model: model})
			self.$el.append( followerView.render().el );

		})
	}

});