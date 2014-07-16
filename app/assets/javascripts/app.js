console.log("sanity check");

var App = App || { Models: {}, Collections: {}, Views: {}, Initializer: {} };

App.Initializer.SavedArticle = function(myStuff){
	collection = new App.Collections.SavedArticleCollection();
	
	collectionView = new App.Views.SavedArticleCollectionView({
		collection: collection,
		el: $('#saved_articles_list')
	});

	// Sends a get request to url: /user/saved_articles, 
	// creates models for each saved_article received in json from controller, 
	// and adds to this.collection
	// collection.fetch();
	collection.add(myStuff);
}

App.Initializer.Followee = function(myStuff){
	collection = new App.Collections.FolloweeCollection();
	
	collectionView = new App.Views.FolloweeCollectionView({
		collection: collection,
		el: $('#followees_list')
	});

	// Sends a get request to url: /user/saved_articles, 
	// creates models for each saved_article received in json from controller, 
	// and adds to this.collection
	// collection.fetch();
	collection.add(myStuff);
}

App.Initializer.Follower = function(myStuff){
	
}