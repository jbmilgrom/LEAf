var App = App || { Models: {}, Collections: {}, Views: {}, Initializer: {} };

App.Collections.SavedArticleCollection = Backbone.Collection.extend({
	initialize: function(){
		console.log("SavedArticleCollection init");		
	},	
	model: App.Models.SavedArticle
	// url: '/users/:user_id/saved_articles'
});