class Post < ActiveRecord::Base
  belongs_to :article

  def parse_url
    # the url seems to appear in at least one of the three attributes in the below array
    # map the attribute array to an array of all positive hits using regex expressing
    url_array = [self.subject, self.raw_text, self.raw_body, self.raw_html].map { |raw_data| /(http:\/\/[\w._?=\-&\/]+)/.match(raw_data) }.compact

    # select the first value of mapped array, which is the return result of a regex matching
    # since the regex mapping itself returns an array, select the first value thereof as well
    self.a_url = url_array[0][0]  
  end

  def emailer_a_user
    User.where(email: self.email)[0] 
  end

  def an_article
    Article.where(a_url: self.a_url)[0]
  end
end
