class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    @question.save
    redirect_to questions_path
  end

  def index
    @questions = Question.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def question_params
    params.require(:question).permit(:title, :image, :observation, :impression, :realization, :uncertainty)
  end

end
