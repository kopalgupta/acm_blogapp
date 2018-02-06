class PostsController < ApplicationController
	http_basic_authenticate_with name: "kopal", password: "acm1234", except: [:index, :show]

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new 
		@post = Post.new
	end

	def create 
		# render plain: params[:post].inspect
		@post = Post.new(post_params)

		if(@post.save)
			redirect_to @post
			# will redirect to show view
		else
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if(@post.update(post_params))
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy 
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end

	private def post_params # only accessed by this class
		params.require(:post).permit(:title, :body)
		# only title and body are the allowed parameters, post won't accept anything else
	end

end
