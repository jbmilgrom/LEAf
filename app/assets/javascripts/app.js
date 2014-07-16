var App = App || { Models: {}, Collections: {}, Views: {}, Initializer: {} };

App.Initializer.Article = function(firstLoad){
	collection = new App.Collections.ArticleCollection();
	
	collectionView = new App.Views.ArticleCollectionView({
		collection: collection,
		el: $('#articles_list')
	});

	// Sends a get request to url: /user/saved_articles, 
	// creates models for each saved_article received in json from controller, 
	// and adds to this.collection
	// collection.fetch();
	collection.add(firstLoad);
}

App.Initializer.Followee = function(firstLoad, user_id){
	var user_id = user_id;
	collection = new App.Collections.FolloweeCollection([], {user_id: user_id});
	
	collectionView = new App.Views.FolloweeCollectionView({
		collection: collection,
		el: $('#followees_list')
	});

	collection.add(firstLoad);
}

App.Initializer.Follower = function(firstLoad, user_id){
	var user_id = user_id;
	collection = new App.Collections.FollowerCollection([], {user_id: user_id});
	
	collectionView = new App.Views.FollowerCollectionView({
		collection: collection,
		el: $('#followers_list')
	});

	collection.add(firstLoad);
}


