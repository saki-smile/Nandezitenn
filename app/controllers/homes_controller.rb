class HomesController < ApplicationController
  def top
    @rank = Question.joins(:favorites).group(:question_id).order(Arel.sql('count(question_id) desc')).limit(3)
  end

  def about
  end
end
