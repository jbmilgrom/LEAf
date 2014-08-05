var App = App || { Models: {}, Collections: {}, Views: {}, Initializer: {}, CurrentUser: {} };

App.Models.Followee = Backbone.Model.extend({
	initialize: function(){
		console.log("Followee has been created");
	}
	
});