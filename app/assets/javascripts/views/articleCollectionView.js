var App = App || { Models: {}, Collections: {}, Views: {}, Initializer: {} };

App.Views.ArticleCollectionView = Backbone.View.extend({
	
	initialize: function(){
		console.log("ArticleCollectionView initialize");
		this.listenTo(this.collection, 'all', this.render);
	},

	render: function(){
		var self = this;
		this.$el.empty();
		console.log("ArticleCollectionView is rendering");
		// debugger
		// Note that A Backbone View cannot be passed anything but a Backbone Model
		// Fortunately, at this point, the Collection has been populated with Models
		_.each(this.collection.models, function(model){
			// debugger
			var articleView = new App.Views.ArticleView({model: model})
			// debugger
			self.$el.append( articleView.render().el );
			// debugger
		})
	}

});