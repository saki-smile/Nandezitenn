class QuestionsController < ApplicationController
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
    @categories = Category.all
    @questions = Question.page(params[:page]).reverse_order
  end

  def show
    @categories = Category.all
    @question = Question.find(params[:id])
    @comment = Comment.new
    @comments = @question.comments
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "なんで記事を編集しました"
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :image, :observation, :impression, :realization, :uncertainty)
  end

end
