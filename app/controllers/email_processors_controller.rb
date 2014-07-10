class EmailProcessorsController < ApplicationController

	def new
	end

	def create
		puts "=================="
		puts "=================="
		puts params
		puts "=================="
		puts "=================="
		
		redirect_to root_path
		# test_email = TestEmail.create({data: params})
	end
end
