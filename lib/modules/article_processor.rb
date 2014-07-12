module ArticleProcessor
	require 'open-uri'

	def get_doc(url)
		@doc = Nokogiri.HTML(open(url))
	end

	def header
		@article = @doc.xpath("//article//header") if @doc.xpath("//article//header")
	end

	def print_to_s(ng_object)
		s = ""
		ng_object.children.each do |object|
			s += object.to_s
		end
		return s
	end

end