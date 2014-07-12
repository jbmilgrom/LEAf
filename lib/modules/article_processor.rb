class ProcessedArticle
	require 'open-uri'
	attr_accessor :url
	# def ng_work?
	# 	Nokogiri.HTML(open(url)).defined?
	# end
	def initialize(url)
		@url = url
	end	

	def doc
		@doc = Nokogiri.HTML(open(@url))
	end

	def header
		@article = @doc.xpath("//article//header") if @doc.xpath("//article//header").to_a != []
	end

	def print_to_s(ng_object)
		s = ""
		ng_object.children.each do |object|
			s += object.to_s
		end
		return s
	end

end