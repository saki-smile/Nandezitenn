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
    if @user == current_user || current_user.admin?
      render :edit
    else
      redirect_to users_path
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "プロフィールを編集しました"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image, :is_active)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
