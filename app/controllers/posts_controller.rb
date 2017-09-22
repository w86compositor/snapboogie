class PostsController < ApplicationController
	before_action :owned_post, only: [:edit, :update, :destroy]
	before_action :set_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!
	
	def index
		@posts = Post.all
	end

	def show
	end

	def new
  	@post = current_user.posts.build
	end

	def edit
	end
	
	def create
		@post = current_user.posts.build(post_params)

		if @post.save
			flash[:notice] = "Your post has been created!"
			redirect_to posts_path
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

	def owned_post
		unless current_user == @post.user
		flash[:alert] = "That post doesn't belong to you!"
		redirect_to root_path
		end
	end
		
end
