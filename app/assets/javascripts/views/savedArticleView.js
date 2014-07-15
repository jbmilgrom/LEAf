var App = App || { Models: {}, Collections: {}, Views: {} };

console.log("STARTING to read SavedArticleView.js")

App.Views.SavedArticleView = Backbone.View.extend({
	initialize: function(){
		// this listens for a crUUUUd (i.e. update) operation
		// this.template();
		console.log("SavedArticleView init");
		this.listenTo(this.model, "change", this.render);
	},

	tagName: 'li',
	// template: function(){
	// 	console.log("article view template is called");
	// 	return _.template( $('#saved_articles_template').html() );
	// },
	template: _.template( $('#saved_articles_template').html() ),
	render: function(){
		console.log("article view rendering")
		this.$el.empty();
		this.$el.html(this.template( this.model.attributes ));

		return this;
	}	
});

console.log("finished reading SavedArticleView.js");