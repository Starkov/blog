class PostsController < ApplicationController
    before_filter :authenticate_user!, :except => [:index, :show]
    load_and_authorize_resource
    skip_authorize_resource :only => [:index, :show]
    
	def new
		 @post = Post.new
	end
	def index
 		@posts = Post.paginate(:page => params[:page], :per_page => 3)
	end
  def belong_to_user
    if user_signed_in?
      @posts = Post.where(:user_id=> current_user.id)
      @posts = @posts.paginate(:page => params[:page], :per_page => 3)
    end
  end
	def show
		  @post = Post.find(params[:id])
	end
	def create
    if @post = Post.create(params[:post].permit(:title, :text, :user_id))
    		redirect_to @post
  		else
    		render 'new'
  		end
	end
 	def edit
      @post = Post.accessible_by(current_ability).find(params[:id])
  end
  def update
 		 
      @post = Post.accessible_by(current_ability).find(params[:id])
 
    	if @post.update(params[:post].permit(:title, :text))
     		redirect_to @post
   	  else
      	render 'edit'
   	  end
	end
	def destroy
  		@post = Post.accessible_by(current_ability).find(params[:id])
  		@post.destroy
 
  		redirect_to posts_path
  end
end
