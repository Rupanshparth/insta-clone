class AccountsController < ApplicationController
    before_action :authenticate_account!
    before_action :set_account, only: [:profile]
    def index
        @posts = Post.active
    end

    def profile
        @my_posts = @account.posts.active
        if current_account == @account
            @suggested_accounts = Account.where.not(id: current_account.following.pluck(:id) + [current_account.id]).limit(5)
  end
    end

    def set_account
        @account = Account.find_by_username(params[:username])
    end

    def followers
        @account = Account.find(params[:id])
        @followers = @account.followers
    end

    def following
        @account = Account.find(params[:id])
        @following = @account.following
    end

end

