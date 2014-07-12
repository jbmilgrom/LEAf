class EmailProcessor
  # include ArticleProcessor

  def initialize(email)
    @email = email
  end

  def process
  	Post.create!({ 
      subject: @email.subject,
      body: @email.body, 

      #token information is breaking
      #############################
      # token: @email.from[:token],

      host: @email.from[:host],
      email: @email.from[:email],
      full: @email.from[:full],
      name: @email.from[:name],
      raw_text: @email.raw_text,
      raw_html: @email.raw_html,
      raw_body: @email.raw_body,
      attachments: @email.attachments[0]
    })
  end

end

#@EMAIL SPEC - COPIED FROM THOUGHTBOT GITHUB
#############################################

#to An array of hashes containing recipient address information. See Email Addresses for more information.
#from A hash containing the sender address information.
  # :token  All the text before the email's "@". We've found that this is the most often used portion of the email address and consider it to be the token we'll key off of for interaction with our application.
  # :host All the text after the email's "@". This is important to filter the recipients sent to the application vs emails to other domains. More info below on the Upgrading to 0.5.0 section.
  # :email  The email address of the recipient.
  # :full The whole recipient field (e.g., Some User <hello@example.com>).
  # :name The name of the recipient (e.g., Some User).
#cc An array of hashes containing cc email address information.
#subject  The subject of the email message.
#body The full contents of the email body unless there is a line in the email containing the string -- Reply ABOVE THIS LINE --. In that case .body will contain everything before that line.
#raw_text The raw text part of the body.
#raw_html The raw html part of the body.
#raw_body The raw body information provided by the email service.
#attachments  An array of File objects containing any attachments.
#headers  A hash of headers parsed by Mail::Header.

############################################
#raw_headers