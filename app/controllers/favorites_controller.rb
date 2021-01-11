class FavoritesController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    favorite = current_user.favorites.build(question_id: @question.id)
    favorite.save
    render :index
  end

  def destroy
    @question = Question.find(params[:question_id])
    favorite = current_user.favorites.find_by(question_id: @question.id)
    favorite.destroy
    render :index
  end
end
