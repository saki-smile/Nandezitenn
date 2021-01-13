class QuestionsController < ApplicationController
  before_action :set_categories, only: [:index, :show]
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def search
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
      flash[:notice] = "なんで記事を投稿しました"
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def index
    @questions = Question.page(params[:page]).reverse_order
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @questions = @category.questions.page(params[:page]).reverse_order
    end
  end

  def show
    @comment = Comment.new
    @comments = @question.comments
  end

  def edit
  end

  def update
    if @question.update(question_params)
      flash[:notice] = "なんで記事を編集しました"
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :category_id, :image, :observation, :impression, :realization, :uncertainty)
  end

  def set_categories
    @categories = Category.all
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
