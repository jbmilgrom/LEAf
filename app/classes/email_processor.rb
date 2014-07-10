class EmailProcessor
  
  # attr_accessor :body, :email, :name
  def initialize(email)
    @@email_logger ||= Logger.new("#{Rails.root}/log/email_bs.log")
    @@email_logger.info("Initializing new EmailProcessor")
    @@email_logger.info(email.inspect)
    
    @email = email
    @@email_logger.info("Done")
  end

  def process
    
    @@email_logger.info("Processing email")
    @@email_logger.info(@email.inspect)
  	Post.create!({ 
      body: @email.body, 
      from: @email.from 
      })
    @@email_logger.info("Done.")
  end
  # def self.process(email)
  #   Post.create!({ body: email.body, from: email.from })
  # end
end