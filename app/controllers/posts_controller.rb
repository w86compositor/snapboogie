class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!
	
	def index
		@posts = Post.all
	end

	def show
	end

	def new
  	@post = Post.new
	end

	def edit
	end
	
	def create
		if @post = Post.create(post_params)
			flash[:notice] = "Your post has been created!"
		redirect_to root_path
		else
			flash.now[:alert] = "Your post could not be created, please check the form."
			render :new
		end
	end

	def update
		if @post.update(post_params)
			flash[:notice] = "Post updated!"
			redirect_to post_path(@post)
		else
			flash.now[:notice] = "Update failed. Please check the form."
			render :edit
		end
	end

	def destroy
		@post.destroy

		redirect_to  posts_path
	end

private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
	  params.require(:post).permit(:picture, :caption)
	end
		
end
