var App = App || { Models: {}, Collections: {}, Views: {} };

console.log("STARTING to read SavedArticleView.js")

App.Views.SavedArticleView = Backbone.View.extend({
	initialize: function(){
		// this listens for a crUUUUd (i.e. update) operation
		console.log("SavedArticleView init");
		this.listenTo(this.model, "change", this.render);
		this.listenTo(this.model, "destroy", this.remove);
	},

	tagName: 'div',
	className: 'row',
	// template: function(){
	// 	console.log("article view template is called");
	// 	return _.template( $('#saved_articles_template').html() );
	// },
	events: {
		'click button[name="delete_comment"]': 'removeComment'
	},

	template: function() {
		return _.template( $('#saved_articles_template').html() )
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

console.log("finished reading SavedArticleView.js");
