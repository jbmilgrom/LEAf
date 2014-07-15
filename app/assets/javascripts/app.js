var App = App || { Models: {}, Collections: {}, Views: {} };

App.Initialize = function(){
	collection = new App.Collections.SavedArticleCollection();
	
	collectionView = new App.Views.SavedArticleCollectionView({
		collection: collection,
		el: $('#saved_articles_list')
	});

	// Sends a get request to url: /user/saved_articles, 
	// creates models for each saved_article received in json from controller, 
	// and adds to this.collection
	// collection.fetch();
	collection.add({id: "1", url: "googl/com"});
}

$(function(){
	console.log("hello world");

	App.Initialize();


});