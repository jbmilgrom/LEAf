class EmailProcessorsController < ApplicationController

	def new
	end

	def create
		puts "=================="
		puts "=================="
		puts params
		puts "=================="
		puts "=================="
		
		# test_email = TestEmail.create({data: params})
	end
end
