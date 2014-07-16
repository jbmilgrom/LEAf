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
		'click button[data-action="delete"]': 'deleteUser'
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

	deleteUser: function(){
		this.model.destroy();

		return this;
	}	
});

console.log("finished reading UserView.js");