class EmailProcessor
  
  # attr_accessor :body, :email, :name
  def initialize(email)
    @my_sane_log_messages = []
    @my_sane_log_messages.push("Initializing new EmailProcessor")
    @my_sane_log_messages.push(email.inspect)
    
    @email = email
    @my_sane_log_messages.push("Done")
  end

  def process
    
    @my_sane_log_messages.push("Processing email")
    @my_sane_log_messages.push(@email.inspect)
  	Post.create!({ 
      body: @email.body, 
      from: @email.from 
      })
    @my_sane_log_messages.push("Done.")
    puts @my_sane_log_messages
  end
  # def self.process(email)
  #   Post.create!({ body: email.body, from: email.from })
  # end
end