class PostsController < ApplicationController
	before_action :is_signed_in?, only: [:new, :create]

	def new
		@post = Post.new
	end

	def create

	end

	def is_signed_in?
		unless signed_in?
			redirect_to login_path
		end
	end
end
