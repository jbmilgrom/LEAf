var App = App || { Models: {}, Collections: {}, Views: {}, Initializer: {}, CurrentUser: {} };

App.Collections.UserCollection = Backbone.Collection.extend({
	initialize: function(models, options){
		console.log("UserCollection init");
		this.user_id = options.user_id;

	},

	model: App.Models.User,
	
	url: function(){
		return '/users/' + this.user_id + 'followees';
	}
});