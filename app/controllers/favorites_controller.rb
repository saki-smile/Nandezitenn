class FavoritesController < ApplicationController
  before_action :set_question, only: [:create, :destroy]

  def create
    favorite = current_user.favorites.build(question_id: @question.id)
    favorite.save
    render :index
  end

  def destroy
    favorite = current_user.favorites.find_by(question_id: @question.id)
    favorite.destroy
    render :index
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end
end
