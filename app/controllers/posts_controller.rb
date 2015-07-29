class PostsController < ApplicationController
	before_action :is_signed_in?, only: [:new, :create]

	def index
		@posts = Post.all.order(created_at: :desc)
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if @post.save
			flash[:success] = "Post sucessfully made"
			redirect_to root_path
		else
			flash[:error] = "Post failed to be made"
			render 'new'
		end
	end

	def is_signed_in?
		unless signed_in?
			redirect_to login_path
		end
	end

	private
		def post_params
			params.require(:post).permit(:title, :body, :user_id)
		end
end
