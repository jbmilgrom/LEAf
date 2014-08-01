var App = App || { Models: {}, Collections: {}, Views: {}, Initializer: {} };

App.Views.ArticleView = Backbone.View.extend({
	initialize: function(){
		// this listens for a crUUUUd (i.e. update) operation
		console.log("ArticleView init");
		this.listenTo(this.model, "change", this.render);
		this.listenTo(this.model, "destroy", this.remove);
	},

	events: {
		'click a[data-action="destroy"]': 'removeArticle'
	},

	template_one: function() { 
		return _.template( $('#articles_template_received').html() ); 
	},

	template_two: function() { 
		return _.template( $('#articles_template_not_received').html() ); 
	},

	render: function(){
		console.log("article view rendering");		
		this.$el.empty();
		if (this.model.get("received?") === true) {
			this.$el.html(this.template_one()(this.model.attributes));
		} else {
			this.$el.html(this.template_two()(this.model.attributes));
		}

		return this;
	},

	removeArticle: function(){
		this.model.destroy();

		return this;
	}	
});

