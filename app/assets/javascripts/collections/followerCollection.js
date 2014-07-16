var App = App || { Models: {}, Collections: {}, Views: {}, Initializer: {} };

App.Collections.FollowerCollection = Backbone.Collection.extend({
	initialize: function(models, options){
		console.log("FollowerCollection init");
		this.user_id = options.user_id		
	},

	model: App.Models.Follower,
	
	url: function(){
		return '/users/' + this.user_id + '/followers';
	}
});