class PostsController < ApplicationController
	
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
  	@post = Post.new
	end

	def edit
		@post = Post.find(params[:id])
	end
	
	def create
		@post = Post.create(post_params)
		redirect_to root_path
	end

	def update
		@post = Post.find(params[:id])
		@post.update(post_params)
		redirect_to post_path(@post)
	end

	def destroy
	end

private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

	def post_params
	  params.require(:post).permit(:picture)
	end
		
end
