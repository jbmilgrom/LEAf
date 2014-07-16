var App = App || { Models: {}, Collections: {}, Views: {}, Initializer: {} };

App.Models.Follower = Backbone.Model.extend({
	initialize: function(){
		console.log("Follower has been created");
	},

	defaults: {
		first_name: 'FIRST NAME'
	}
});