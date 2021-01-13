class UsersController < ApplicationController
  before_action :set_user, only: [:show, :favorite, :edit, :update]

  def show
    @questions = @user.questions.page(params[:page]).reverse_order
  end

  def index
    @categories = Category.all
    @users = User.page(params[:page]).reverse_order
  end

  def favorite
    @favorite_questions = @user.favorite_questions.page(params[:page]).reverse_order
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
