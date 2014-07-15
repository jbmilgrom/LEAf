var App = App || { Models: {}, Collections: {}, Views: {} };

App.Views.SavedArticleCollectionView = Backbone.View.extend({
	
	initialize: function(){
		console.log("article collectionview initialize")
		this.listenTo(this.collection, 'all', this.render);
	},

	render: function(){
		var self = this;
		this.$el.empty();
		console.log("SavedArticleCollectionView is rendering");
		debugger
		// Note that A Backbone View cannot be passed anything but a Backbone Model
		// Fortunately, at this point, the Collection has been populated with Models
		_.each(this.collection.models, function(model){
			debugger
			var savedArticleView = new App.Views.SavedArticleView({model: model})
			debugger
			self.$el.append( savedArticleView.render().el );
			debugger
		})
	}

});