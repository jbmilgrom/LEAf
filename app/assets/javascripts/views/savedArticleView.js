var App = App || { Models: {}, Collections: {}, Views: {} };

console.log("STARTING to read SavedArticleView.js")

App.Views.SavedArticleView = Backbone.View.extend({
	initialize: function(){
		// this listens for a crUUUUd (i.e. update) operation
		this.listenTo(this.model, "change", this.render);
	},

	// tagName: 'li',
	template: _.template( $('<script type="text/template"><h2><%= id %></h2><h4><%= url %></h4></script>').html() ),
	render: function(){
		this.$el.empty();
		this.$el.html(this.template( this.model.attributes ));

		return this
	}	
});

console.log("finished reading SavedArticleView.js");