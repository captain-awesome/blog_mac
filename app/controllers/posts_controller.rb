class PostsController < ApplicationController
before_action :find_post, only: [:show, :edit, :update, :destroy]	
before_action :authenticate_user!, except: [:index, :show]
before_action :post_auth, only: [:edit, :update, :destroy]

	def index
		@posts = Post.all.order('created_at DESC')
	end

	def new
		#@post = Post.new
		@post = current_user.posts.build
	end

	def create
		@post = Post.new(post_params)
		@post = current_user.posts.build(post_params)

		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @post.update(params[:post].permit(:title, :body))
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to root_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :body)
	end

	def find_post
		@post = Post.find(params[:id])
	end

	# Checks if current user authored pin      
	def post_auth
		if current_user != @post.user
		redirect_to(root_path)
		end
	end

end