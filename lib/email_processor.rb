class EmailProcessor
  def self.process(email)
    Email.create!({ body: email.body, email: email.from })
  end
end