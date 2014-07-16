var App = App || { Models: {}, Collections: {}, Views: {}, Initializer: {} };

App.Collections.ArticleCollection = Backbone.Collection.extend({
	initialize: function(){
		console.log("ArticleCollection init");		
	},	
	model: App.Models.Article
	// url: function(){
	// 	return '/users/' + this.user_id + '/articles';
	// }
});