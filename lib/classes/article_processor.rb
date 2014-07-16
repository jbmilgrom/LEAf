class ArticleProcessor
	require 'open-uri'

	def initialize(url)
		@doc_one = Pismo::Document.new(url)
		@doc_two = Pismo::Document.new(url, :reader => :cluster)
	end	

	def description
		compare(:description)
	end

	def title
		compare(:title)
	end

	def sentences(num)
		compare_with_arg(:sentences, num)
	end

	def body
		compare(:body)
	end

	# private

  def compare(data_type)
    ( @doc_one.send(data_type) unless @doc_one.send(data_type) == "" ) || ( @doc_two.send(data_type) unless @doc_two.send(data_type) == "" )
  end

	def compare_with_arg(data_type, num)
		( @doc_one.send(data_type, num) unless @doc_one.send(data_type, num) == "" ) || ( @doc_two.send(data_type, num) unless @doc_two.send(data_type, num) == "" )
	end

end