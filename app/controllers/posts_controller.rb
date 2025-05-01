class PostsController < ApplicationController
    before_action :authenticate_account!

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.account_id = current_account.id
        @post.active = true
        if @post.save
            redirect_to dashboard_path, flash: { success: "Post created successfully!" }
        else
            redirect_to new_post_path, flash: { error: "Failed to create post." }
        end
    end

    def delete
        if @post.destroy
            redirect_to dashboard_path, flash: { success: "Post deleted successfully!" }
        else
            redirect_to dashboard_path, flash: { error: "Failed to delete post." }
        end
    end

    

    def show
        @post = Post.find(params[:id])
    end

    private

    def authorize_account!
        unless @post.account == current_account
          redirect_to root_path, alert: "You are not authorized to delete this post."
        end
    end

    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:image, :image_cache, :caption)
    end
end
    