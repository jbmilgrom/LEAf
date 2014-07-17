var App = App || { Models: {}, Collections: {}, Views: {}, Initializer: {} };

App.Views.ArticleView = Backbone.View.extend({
	initialize: function(){
		// this listens for a crUUUUd (i.e. update) operation
		console.log("ArticleView init");
		this.listenTo(this.model, "change", this.render);
		this.listenTo(this.model, "destroy", this.remove);
	},

	events: {
		'click button[data-action="destroy"]': 'removeArticle'
	},

	template: function() { 
		return _.template( $('#articles_template').html() ); 
	},

	render: function(){
		console.log("article view rendering");		
		this.$el.empty();
		this.$el.html(this.template()(this.model.attributes));

		return this;
	},

	removeArticle: function(){
		this.model.destroy();

		return this;
	}	
});

