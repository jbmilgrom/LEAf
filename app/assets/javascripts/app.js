var App = App || { Models: {}, Collections: {}, Views: {}, Initializer: {} };

App.Initializer.Article = function(firstLoad, user_id){
	var user_id = user_id;
	var articleCollection = new App.Collections.ArticleCollection([], {user_id: user_id});
	
	var collectionView = new App.Views.ArticleCollectionView({
		collection: articleCollection,
		el: $('#articles_list')
	});

	// Sends a get request to url: /user/saved_articles, 
	// creates models for each saved_article received in json from controller, 
	// and adds to this.collection
	// collection.fetch();
	articleCollection.add(firstLoad);
}


App.Initializer.Followee = function(firstLoad, user_id){
	var user_id = user_id;
	var followeeCollection = new App.Collections.FolloweeCollection([], {user_id: user_id});
	
	var collectionView = new App.Views.FolloweeCollectionView({
		collection: followeeCollection,
		el: $('#followees_list')
	});

	followeeCollection.add(firstLoad);
}

// App.Initializer.FolloweeCreate = function(user_id){
// 	var user_id = user_id;
// 	var followeeCollection = new App.Collections.FolloweeCollection([], {user_id: user_id});

// }

App.Initializer.Follower = function(firstLoad, user_id){
	var user_id = user_id;
	var followerCollection = new App.Collections.FollowerCollection([], {user_id: user_id});
	
	var collectionView = new App.Views.FollowerCollectionView({
		collection: followerCollection,
		el: $('#followers_list')
	});

	followerCollection.add(firstLoad);
}

App.Initializer.User = function(firstLoad, user_id){
	var user_id = user_id;
	userCollection = new App.Collections.UserCollection([], {user_id: user_id});
	
	var collectionView = new App.Views.UserCollectionView({
		collection: userCollection,
		el: $('#users_list')
	});

	userCollection.add(firstLoad);
}


