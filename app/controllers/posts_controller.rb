class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new 

	end

	def create 
		# render plain: params[:post].inspect
		@post = Post.new(post_params)

		@post.save
		redirect_to @post
		# will redirect to show view
	end

	private def post_params # only accessed by this class
		params.require(:post).permit(:title, :body)
		# only title and body are the allowed parameters, post won't accept anything else
	end

end
