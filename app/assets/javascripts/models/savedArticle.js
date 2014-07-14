var App = App || { Models: {}, Collections: {}, Views: {} };

App.Models.SavedArticle = Backbone.Model.extend({
	initialize: function(){
		console.log("SavedArticle has been created");
	}
})