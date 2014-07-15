console.log("sanity check");

var App = App || { Models: {}, Collections: {}, Views: {} };

App.Initialize = function(myStuff){
	collection = new App.Collections.SavedArticleCollection();
	
	collectionView = new App.Views.SavedArticleCollectionView({
		collection: collection,
		el: $('#saved_articles_list')
	});

	// Sends a get request to url: /user/saved_articles, 
	// creates models for each saved_article received in json from controller, 
	// and adds to this.collection
	// collection.fetch();
	// model = {url: "googl.com"};
	// model1 = {url: "smogoogl.com"};
	// collection.add([model, model1]);
	collection.add(myStuff);
}