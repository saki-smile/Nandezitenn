class CommentsController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    #投稿に紐づいたコメントを作成
    @comment = @question.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    render :index
  end

  def destroy
    @question = Question.find(params[:question_id])
    comment =  Comment.find_by(id: params[:id], question_id: params[:question_id])
    comment.destroy
    render :index
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
