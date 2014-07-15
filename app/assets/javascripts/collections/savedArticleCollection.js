var App = App || { Models: {}, Collections: {}, Views: {} };

App.Collections.SavedArticleCollection = Backbone.Collection.extend({
	initialize: function(){
		console.log("SavedArticleCollection init");		
	},	
	model: App.Models.SavedArticle,
	url: '/user/saved_articles'
});