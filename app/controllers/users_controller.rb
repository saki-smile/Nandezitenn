class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @questions = @user.questions.page(params[:page]).reverse_order
    @favorite_questions = @user.favorite_questions
  end

  def index
    @categories = Category.all
    @users = User.page(params[:page]).reverse_order
  end

  def favorite
    @user = User.find(params[:id])
    @favorite_questions = @user.favorite_questions.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end

end
