class EmailProcessor
  
  # attr_accessor :body, :email, :name
  def initialize(email)
    puts email
    @email = email
  end

  def process
    puts "method invoked"
    print @email
  	Post.create!({ 
      body: @email.body, 
      from: @email.from 
      })
  end
  # def self.process(email)
  #   Post.create!({ body: email.body, from: email.from })
  # end
end