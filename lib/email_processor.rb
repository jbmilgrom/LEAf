class EmailProcessor
  
  # for testing show.html.erb
  # attr_accessor :body, :email, :name

  def self.process(email)
    Post.create!({ body: email.body, sender: email.from })
  end
end