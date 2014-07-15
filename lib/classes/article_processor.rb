class ArticleProcessor
	require 'open-uri'
	# attr_accessor :url, :title, :body, :sentences, :description
	# def ng_work?
	# 	Nokogiri.HTML(open(url)).defined?
	# end
	def initialize(url)
		# url = url
		# @doc = Nokogiri.HTML(open(url, 'User-Agent' => 'ruby'))
		@doc_one = Pismo::Document.new(url)
		@doc_two = Pismo::Document.new(url, :reader => :cluster)
	end	

	# def doc
	# 	@doc = Nokogiri.HTML(open(@url))
	# end
	def description
		compare(:description)
	end

	def title
		compare(:title)
	end

	def sentences(num)
		compare(:sentences, num)
	end

	def body
		compare(:body)
	end
	
	# def part_of_doc(header)
	# 	ng_object = @doc.xpath("//article//#{header}") if @doc.xpath("//article//header").to_a != []
	# 	print_to_s(ng_object)
	# end

	# def title
	# 	ng_object = @doc.title
	# end

	# def print_to_s(ng_object)
	# 	s = ""
	# 	ng_object.children.each do |object|
	# 		s += object.to_s
	# 	end
	# 	return s
	# end

	private

	def compare(data_type, num = nil)
		( @doc_one.send(data_type, num) unless @doc_one.send(data_type, num) == "" ) || ( @doc_two.send(data_type, num) unless @doc_two.send(data_type, num) == "" )
	end



end