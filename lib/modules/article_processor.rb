class ArticleProcessor
	require 'open-uri'
	attr_accessor :url
	# def ng_work?
	# 	Nokogiri.HTML(open(url)).defined?
	# end
	def initialize(url)
		# url = url
		@doc = Nokogiri.HTML(open(url))
	end	

	# def doc
	# 	@doc = Nokogiri.HTML(open(@url))
	# end

	def part_of_doc(header)
		ng_object = @doc.xpath("//article//#{header}") if @doc.xpath("//article//header").to_a != []
		print_to_s(ng_object)
	end

	def print_to_s(ng_object)
		s = ""
		ng_object.children.each do |object|
			s += object.to_s
		end
		return s
	end

end