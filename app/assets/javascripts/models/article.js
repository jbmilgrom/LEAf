var App = App || { Models: {}, Collections: {}, Views: {}, Initializer: {} };

App.Models.Article = Backbone.Model.extend({
	initialize: function(){
		console.log("Article has been created");

		// create a dummy articleCollection associated with current_user
		// so that c_u can dump any savedArticles here through save button
		// created a new SavedArticle instance
		// remember that doing this doesnt render a view in the incorrect page because 
		// no vies associated with this collection have been created
		// var users = {
		// 	user_id: this.collection.current_user_id,
		// 	current_user_id: this.collection.current_user_id
		// } 
		// this.set("currentUserArticleCollection", new App.Collections.ArticleCollection([], {users: users}));		

	},

	defaults: {
		a_url: 'www.jonathan.com'
	}
});