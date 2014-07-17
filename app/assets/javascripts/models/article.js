var App = App || { Models: {}, Collections: {}, Views: {}, Initializer: {} };

App.Models.Article = Backbone.Model.extend({
	initialize: function(){
		console.log("Article has been created");
	},

	defaults: {
		a_url: 'www.jonathan.com'
	}
});