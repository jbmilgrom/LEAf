class EmailProcessor
  
  # for testing show.html.erb
  attr_accessor :body, :email, :name

  def self.process(email)
    Email.create!({ body: email.body, email: email.from })
  end
end