class Post < ActiveRecord::Base
	belongs_to :article

	def parse_url
    # binding.pry
    [@raw_text, @raw_body, @raw_html].select { |raw_data| /(http:\/\/[\w._?=&\/]+)/.match(raw_data) }
  end
end
