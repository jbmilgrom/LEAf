var App = App || { Models: {}, Collections: {}, Views: {}, Initializer: {}, CurrentUser: {} };

console.log("STARTING to read UserView.js")

App.Views.UserView = Backbone.View.extend({
	initialize: function(){
		// this listens for a crUUUUd (i.e. update) operation
		console.log("UserView init");
		this.listenTo(this.model, "change", this.render);
		// this.listenTo(this.model, "destroy", this.remove);
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

	followUser: function(e){
		
		e.preventDefault();
		console.log("followUser init");

		// followeeCollection is created as an attribute of userCollection upon intialization
		this.model.attributes.followeeCollection.create({followee_id: this.model.attributes.id});
		
		// removes element from the DOM (and corresponding listers)
		// Does not touch model itself and view object assosicated therewith, which is we we can return this
		this.remove();

		//######## TO DO ##########
		// Provide a notice of some sort when discoverable User is removed from page
		// change button to unfollow		
		// ####### END ########

		return this;
	}	
});

console.log("finished reading UserView.js");