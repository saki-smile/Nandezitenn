class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    # @user = User.find(params[:user_id])
    current_user.follow(params[:user_id])
    render :index
  end

  def destroy
    # @user = User.find(params[:user_id])
    current_user.unfollow(params[:user_id])
    render :index
  end

  # 自分がフォローしている人
  def followed
    user = User.find(params[:user_id])
    @users = user.following_user
  end

  # 自分をフォローしている人
  def follower
    user = User.find(params[:user_id])
    @users = user.follower_user
  end
end
