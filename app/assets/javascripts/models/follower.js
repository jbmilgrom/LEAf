var App = App || { Models: {}, Collections: {}, Views: {}, Initializer: {}, CurrentUser: {} };

App.Models.Follower = Backbone.Model.extend({
	initialize: function(){
		console.log("Follower has been created");
	},

	defaults: {
		first_name: 'FIRST NAME'
	}
});