var App = App || { Models: {}, Collections: {}, Views: {}, Initializer: {}, CurrentUser: {} };

App.Initializer.Article = function(firstLoad, users){
	var user_id = users.user_id;
	var current_user_id = users.current_user_id;
	var articleCollection = new App.Collections.ArticleCollection([], {user_id: user_id});
	
	// creating an articleCollection for c_u without creating corresponding views
	// doing this for save functionality w.r.t. followee articles
	App.CurrentUser.articleCollection = new App.Collections.ArticleCollection([], {user_id: current_user_id});
	
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


