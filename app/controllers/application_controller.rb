class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top, :about, :index, :show, :favorite]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  def set_search
    @search = Question.ransack(params[:q])
    @search_questions = @search.result(distinct: true)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
