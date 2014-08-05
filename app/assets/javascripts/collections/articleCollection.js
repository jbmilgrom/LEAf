var App = App || { Models: {}, Collections: {}, Views: {}, Initializer: {} };

App.Collections.ArticleCollection = Backbone.Collection.extend({
	initialize: function(model, options){
		console.log("ArticleCollection init");
		this.user_id = options.user_id;
		// this.current_user = options.users.current_user_id;		
	},	

	model: App.Models.Article,
	
	url: function(){
		return '/users/' + this.user_id + '/articles';
	}
});