class ArticleProcessor
	require 'open-uri'

  attr_accessor :just_a_url?
	
  def initialize(url)
		begin
			@doc_one = Pismo::Document.new(url)
		rescue Exception => e
      @just_a_url? = url
		end
		# @doc_two = Pismo::Document.new(url, :reader => :cluster)
	end	

	def description
		process(:description)
	end

	def title
		process(:title)
	end

	def sentences(num)
		process_with_arg(:sentences, num)
	end

	def body
		process(:body)
	end

	# private

  def process(data_type)
    if !just_a_url
      @doc_one.send(data_type) unless @doc_one.send(data_type) == ""# ) || ( @doc_two.send(data_type) unless @doc_two.send(data_type) == "" )
    end
  end

	def process_with_arg(data_type, num)
		if !just_a_url 
      @doc_one.send(data_type, num) unless @doc_one.send(data_type, num) == "" #) || ( @doc_two.send(data_type, num) unless @doc_two.send(data_type, num) == "" )
	  end
  end

end