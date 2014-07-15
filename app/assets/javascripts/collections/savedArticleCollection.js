var App = App || { Models: {}, Collections: {}, Views: {} };

App.Collections.SavedArticleCollection = Backbone.Collection.extend({
	model: App.Models.SavedArticle,
	url: '/user/saved_articles'
})