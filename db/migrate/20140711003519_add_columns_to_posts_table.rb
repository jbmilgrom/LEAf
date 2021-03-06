class AddColumnsToPostsTable < ActiveRecord::Migration
  def change
  	# add_column :events, :title, :string
  	remove_column :posts, :from
  	remove_column :posts, :to
  	add_column :posts, :token, :string
  	add_column :posts, :host, :string
  	add_column :posts, :email, :string
  	add_column :posts, :full, :string
  	add_column :posts, :name, :string
  	add_column :posts, :raw_text, :text
  	add_column :posts, :raw_html, :text
  	add_column :posts, :attachements, :text
  end
end

#to	An array of hashes containing recipient address information. See Email Addresses for more information.
#from	A hash containing the sender address information.
	# :token	All the text before the email's "@". We've found that this is the most often used portion of the email address and consider it to be the token we'll key off of for interaction with our application.
	# :host	All the text after the email's "@". This is important to filter the recipients sent to the application vs emails to other domains. More info below on the Upgrading to 0.5.0 section.
	# :email	The email address of the recipient.
	# :full	The whole recipient field (e.g., Some User <hello@example.com>).
	# :name	The name of the recipient (e.g., Some User).
#cc	An array of hashes containing cc email address information.
#subject	The subject of the email message.
#body	The full contents of the email body unless there is a line in the email containing the string -- Reply ABOVE THIS LINE --. In that case .body will contain everything before that line.
#raw_text	The raw text part of the body.
#raw_html	The raw html part of the body.
#raw_body	The raw body information provided by the email service.
#attachments	An array of File objects containing any attachments.
#headers	A hash of headers parsed by Mail::Header.
#raw_headers
