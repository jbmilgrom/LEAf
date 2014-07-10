class EmailProcessorsController < ApplicationController

	def new
		@processed_email = EmailProcessor.new
	end

	def create
		binding.pry
	end
end
