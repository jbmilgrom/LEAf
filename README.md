LEAf
===================

LEAf enables users to save digital content from any device. Email the app from any devise with a url placed anywhere in the email. LEAf recieves the email, recognizes the sender and parses the email for the url. The next time the user visits the user's article page, the app scrapes the article's webpage associated with parsed url.

**Go to [LEAf](http://leafbeta.herokuapp.com/), sign up with your email address, begin sending articles to save@leafbeta.com using the email address that you signed up with, and watch LEAf take care of the rest.**

## Database Models and Associations

Posts are created from incoming emails. Articles are created from parsed Posts. A User is linked to an Article through SavedArticles (join table). Users can have many followeers and followees through a Follow (self join table). For a discussion of the follower/followee relationship in LEAf, please see
[this blog post](http://medium.com/@jbmilgrom/active-record-many-to-many-self-join-table-e0992c27c1e).

## The Email Processor

Thoughtbot's [Griddler gem](https://github.com/jbmilgrom/griddler) (in combination with SendGrid servers) is used to parse incoming email.

Emails sent to /\w/@leafbeta.com are forwarded to [SendGrid](https://sendgrid.com/developer/reply). SendGrid parses the email and sends a POST request to LEAf:

[routes.rb](http://github.com/jbmilgrom/LEAf/blob/master/config/routes.rb)

```ruby
  post '/email_processor' => 'griddler/emails#create'
```


Which directs emails to:
 
[app/classes/email_processor.rb](http://github.com/jbmilgrom/LEAf/blob/master/app/classes/email_processor.rb)

  ```ruby
  class EmailProcessor
    def initialize(email)
      @email = email
    end

    def process
      post = Post.create!({ 
        subject: @email.subject,
        body: @email.body, 
        host: @email.from[:host],
        email: @email.from[:email],
        full: @email.from[:full],
        name: @email.from[:name],
        raw_text: @email.raw_text,
        raw_html: @email.raw_html,
        raw_body: @email.raw_body,
        attachments: @email.attachments[0]
      })

      # save post after parsing @email for the correct article url
      post.parse_url
      post.save
    end
  end
  ```

Posts are created from incoming emails. An instance method of Post parses the contents of the email for the url, applying a regex to pull it out: 

[post.rb](http://github.com/jbmilgrom/LEAf/blob/master/app/models/post.rb)
  	
```ruby
  def parse_url
    # the url appears in at least one of the four attributes in the below array
    # map the attribute array to an array of all positive hits using regex expression
    url_array = [self.subject, self.raw_text, self.raw_body, self.raw_html].map { |raw_data| /(http:\/\/[\w._?=\-&\/]+)/.match(raw_data) }.compact

    # select the first value of mapped array, which is the return result of the regex matching
    # since the regex mapping itself returns an array, select the first value thereof as well
    self.a_url = url_array[0][0]  
  end
```
 

When a user visits the user's articles page, the web page associate with the parsed url is scraped for the contents of the article using the Pismo gem (which is built on top of Nokogiri), an action which is embodied by an instance of ArticleProcessor:

[lib/classes/article_processor.rb](http://github.com/jbmilgrom/LEAf/blob/master/lib/classes/article_processor.rb)

```ruby
class ArticleProcessor
  require 'open-uri'

  attr_reader :received
  alias_method :received?, :received

  def initialize(url)
    begin
      @doc_one = Pismo::Document.new(url)
      @received = true
    rescue Exception => e
      @received = false
    end
      # @doc_two = Pismo::Document.new(url, :reader => :cluster)
  end	

  def description
    process(:description)
  end

  def title
    process(:title)
  end

  def sentences(num)
    process_with_arg(:sentences, num)
  end

  def body
    process(:body)
  end

  # private

  def process(data_type)
    if @received
      @doc_one.send(data_type) unless @doc_one.send(data_type) == ""# ) || ( @doc_two.send(data_type) unless @doc_two.send(data_type) == "" )
    end
  end

  def process_with_arg(data_type, num)
    if @received 
      @doc_one.send(data_type, num) unless @doc_one.send(data_type, num) == "" #) || ( @doc_two.send(data_type, num) unless @doc_two.send(data_type, num) == "" )
    end
  end
end
```

However, this expensive method is only triggerd if it is associated with a new unproccessed Post (note, in later iterations, this will likely be handled through an additional data-field in the Post model set to a boolean value that tracks the state: processed || unprocessed, so as to avoid expensive database calls every time a new Post needs processing): 

[user.rb](http://github.com/jbmilgrom/LEAf/blob/master/app/models/user.rb)

```ruby
  def any_new_posts
    posts = Post.where(email: self.email).to_a
    
    # delete all of the user's posts that have already been turned into Articles and linked to the User (through a SavedArticle)
    # note that if a User posts an article more than once (even months apart), such post will not be sent to  update_articles, and no additional SavedArticle will be created
    # in other words, may want to change the below to allow a user to email himself an article more than once
    # then again, doing so would not filter out accidental duplicate emails/posts
    self.articles.each do |article|
      posts.delete_if { |post| ( article.post_id == post.id ) || ( article.a_url == post.a_url ) }
    end
    return posts
  end
```

In such a case, an article may be created:

[user.rb](http://github.com/jbmilgrom/LEAf/blob/master/app/models/user.rb)

```ruby
def update_articles
  new_user_posts = any_new_posts
  unless new_user_posts[0] == nil
    new_user_posts.each do |user_post|
      
      # match each Post's url with any previously created Article
      # to avoid scraping the same web page more than once and creating duplicate Articles
      if user_post.an_article
        SavedArticle.save_article(self, user_post.an_article)
      else
        
        # any new post (i.e. any url that hasn't already been scrapped and turning into an Article) is turned into an Article (through Pismo processing)
        # then the Article is linked to the User through creation of a SavedArticle
        article = Article.create_article(user_post)
        SavedArticle.save_article(self, article) 
      end
    end
  end
end
```

`Article.create_article(user_post)` creates an instance of ArticleProcessor (which performs the web-scraping as shown above):

[article.rb](https://github.com/jbmilgrom/LEAf/blob/master/app/models/article.rb)

```ruby
def self.create_article(post)       
  article = ArticleProcessor.new(post.a_url)
  Article.create({
    a_url: post.a_url,
    header: article.title,
    subheader: article.sentences(5),
    body: article.body,
    post_id: post.id,
    received?: article.received?
  })
end
```
