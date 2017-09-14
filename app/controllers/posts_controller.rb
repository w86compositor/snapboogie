class PostsController < ApplicationController
	
	def index
	end

	def new
  	@post = Post.create(post_params)
	end

private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

	def post_params
	  params.require(:post).permit(:picture)
	end
		
end
