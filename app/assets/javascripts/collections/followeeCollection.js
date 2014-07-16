var App = App || { Models: {}, Collections: {}, Views: {}, Initializer: {} };

App.Collections.FolloweeCollection = Backbone.Collection.extend({
	initialize: function(models, options){
		console.log("FolloweeCollection init");
		this.user_id = options.user_id		
	},

	model: App.Models.Followee,
	
	url: function(){
		return '/users/' + this.user_id + '/followees';
	}
});