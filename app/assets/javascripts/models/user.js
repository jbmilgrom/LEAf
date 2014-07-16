var App = App || { Models: {}, Collections: {}, Views: {}, Initializer: {} };

App.Models.User = Backbone.Model.extend({
	initialize: function(){
		console.log("User has been created");
	},

	defaults: {
		first_name: 'FIRST NAME'
	}
});