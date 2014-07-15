var App = App || { Models: {}, Collections: {}, Views: {} };

App.Views.SavedArticleCollectionView = Backbone.View.extend({
	
	initialize: function(){
		this.listenTo(this.collection, 'all', this.render);
	},

	render: function(){
		var self = this;
		this.$el.empty();
		// Note that A Backbone View cannot be passed anything but a Backbone Model
		// Fortunately, at this point, the Collection has been populated with Models
		_.each(this.collection.models, function(article){
			var savedArticleView = new App.Views.SavedArticleView({model: article})
			self.$el.append( savedArticleView.render().el );
		})
	}

});