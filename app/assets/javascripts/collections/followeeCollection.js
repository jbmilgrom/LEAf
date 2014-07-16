var App = App || { Models: {}, Collections: {}, Views: {}, Initializer: {} };

App.Collections.FolloweeCollection = Backbone.Collection.extend({
	initialize: function(){
		console.log("FolloweeCollection init");		
	},	
	model: App.Models.Followee
	// url: '/user/id/followees'
});