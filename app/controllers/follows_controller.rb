class FollowsController < ApplicationController
  before_action :authenticate_account!

  def create
    followed = Account.find(params[:account_id])
    current_account.following << followed unless current_account == followed
    redirect_back fallback_location: root_path
  end

  def destroy
    followed = Account.find(params[:account_id])
    current_account.following.delete(followed)
    redirect_back fallback_location: root_path
  end
end
