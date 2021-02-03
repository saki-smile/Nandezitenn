class CommentsController < ApplicationController
  before_action :set_question, only: [:create, :destroy]

  def create
    # 投稿に紐づいたコメントを作成
    @comment = @question.comments.build(comment_params)
    @comment.score = Language.get_data(comment_params[:body])
    @comment.user_id = current_user.id
    @comment.save
    render :index
  end

  def destroy
    comment = Comment.find_by(id: params[:id], question_id: params[:question_id])
    comment.destroy
    render :index
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_question
    @question = Question.find(params[:question_id])
  end
end
