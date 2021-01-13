class HomesController < ApplicationController

  def top
    @question_ranks = Question.joins(:favorites).group(:question_id).order('count(question_id) desc').limit(3)
    #joins テーブルを内部結合
    #group question_idが同じものにグループを分ける
    #order question_idの多い順番に並び替える
  end

  def about
  end

end
