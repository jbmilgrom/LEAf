class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
  	Post.create!({ 
      body: @email.body, 
      from: @email.from[:email]
    })
  end
end