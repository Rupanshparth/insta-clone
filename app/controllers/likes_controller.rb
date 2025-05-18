class LikesController < ApplicationController
    before_action :authenticate_account!

    def create
        @post = Post.find(params[:post_id])
        @post.likes.create(account: current_account)

        respond_to do |format|
            format.turbo_stream do
            render turbo_stream: turbo_stream.replace(
                "like_section_post_#{@post.id}",
                partial: "posts/like_button",
                locals: { post: @post }
            )
            end
            format.html { redirect_to request.referer || root_path }
        end
    end

    def destroy
        @post = Post.find(params[:post_id])
        @post.likes.find_by(account: current_account)&.destroy

        respond_to do |format|
            format.turbo_stream do
            render turbo_stream: turbo_stream.replace(
                "like_section_post_#{@post.id}",
                partial: "posts/like_button",
                locals: { post: @post }
            )
            end
            format.html { redirect_to request.referer || root_path }
        end
    end


end
