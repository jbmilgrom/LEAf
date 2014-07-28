var App = App || { Models: {}, Collections: {}, Views: {}, Initializer: {} };

console.log("STARTING to read UserView.js")

App.Views.UserView = Backbone.View.extend({
	initialize: function(){
		// this listens for a crUUUUd (i.e. update) operation
		console.log("UserView init");
		this.listenTo(this.model, "change", this.render);
		this.listenTo(this.model, "destroy", this.remove);
	},

	tagName: 'li',

	events: {
		'click button[data-action="follow"]': 'followUser'
	},

	template: function() { 
		return _.template( $('#user_template').html() )
	},

	render: function(){
		console.log("UserView rendering");		
		this.$el.empty();
		this.$el.html(this.template()(this.model.attributes));

		return this;
	},

	followUser: function(){
		// this.model.destroy();
		console.log("followUser init");
		// Ultimately, think about creating a nested Followee model, and using this function to create a Followee
		// This will allow current user to follow and unfollow on this page --> more complex follow rendering
		// When building the nested model, it may make sense to alter the original Followee Backbone
		// MVC so that template is defined in the initialize function
		// This will give me the ability to reuse the MVC code already written in different views
		// You know what I'm SAYIN' ??
		// In the meantime however (chosing functionality over any complex rendering), all I need is a bare bones ajax call to create a follower
		// But the problem is, there is no such thing as a simple Ajax call to a nested resource
		// i.e I need the current_user.id at the followee level!!!  See ajax call below
		// $.ajax({
		// 	url: '/users/' + user_id + '/followees',
		// 	method: 'post',
		// 	dataType: 'json',
		// 	data: this.model
		// }).done(function(followModel){	
		// 	console.log(followModel);
		// })
		// What I could simple do in the meantime, is an HTML form!  
		// The HTML view has access to all the information necessary to create the proper routing
		// especially considering relative paths
		// This is moot!!!!  "Discover" path gets loaded on first load (after json conversion). 
		// This allows the collection url to be the Crudding url you know and love
		// Again, think about altering the original Followee Backbone
		// MVC so that template is defined in the initialize function
		// This will give me the ability to reuse the Followee MVC code already written with respect to a different views
		// Waaaait, no it doesn't.  Any Discover resource at this point is just a User, not a Followee
		// Sooooo, these Users are, in a sense, input fields for creating a Followee model.  
		// the Followee models truly are nested resources.  They will belong to a "Discover" User.  
		// In other words, to Create a Followee model you are going to have to feed the Followee collection a Discover model

		
		// of course, now it makes sense to delete this function and listener all together
		// the collection.add(model) happens at the.....collection level
		// NOT TRUE!!, since, now, I've made followCollection an attribute of the user Model
		this.model.attributes.followeeCollection.create({followee_id: this.model.attributes.id});
		this.remove();
		//######## TO DO ##########

		// Remove discoverable User from unrefreshed page with a notice of some sort

		// ####### END ########

		// change button to unfollow
		return this;
	}	
});

console.log("finished reading UserView.js");