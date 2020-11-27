class ApplicationController < ActionController::Base
  # ユーザーがログインしているかどうかを確認し、ログインしていないユーザーをログインページの画面に促す
  before_action :authenticate_user!
  # もしdeviseに関するコントローラーの処理であれば、configure_permitted_parametersを呼び出す
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
