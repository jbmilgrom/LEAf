var App = App || { Models: {}, Collections: {}, Views: {}, Initializer: {}, CurrentUser: {} };

App.Views.UserCollectionView = Backbone.View.extend({
	
	initialize: function(){
		console.log("UserCollectionView initialize");
		this.listenTo(this.collection, 'all', this.render);
	},

	render: function(){
		var self = this;
		
		this.$el.empty();
		console.log("UserCollectionView is rendering");	
		this.$el.append("<h1> current_user.id: " + this.collection.user_id + "</h1>");
		
		_.each(this.collection.models, function(model){
			
			var userView = new App.Views.UserView({model: model})
			self.$el.append( userView.render().el );

		})
	},

});