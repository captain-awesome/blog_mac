class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment].permit(:name, :body))
		redirect_to post_path(@post)
	end

	def detroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		redirect_to post_path(@post)
	end
	
end
