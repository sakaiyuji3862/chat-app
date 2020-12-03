class ApplicationController < ActionController::Base
  # ユーザーがログインしているかどうかを確認し、ログインしていないユーザーをログインページの画面に促す
  before_action :authenticate_user!  # オーセンタケイト_ユーザー!
  # もしdeviseに関するコントローラーの処理であれば、configure_permitted_parametersを呼び出す
  before_action :configure_permitted_parameters, if: :devise_controller?

  # private  クラスの外から呼び出せない。内部からのみ呼び出せる。
  private
  def configure_permitted_parameters
    # deviseのUserモデルにパラメーターを許可。permit(:deviseの処理名, keys: [:許可するキー])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end # ↑ deviseでユーザー登録をする場合に使用でき、『特定のカラムを許容する』メソッド。
end


resources :rooms, only:[:destroy]

<%= link_to "チャットを終了する", "room_path(@room)", method: :delete %>

def destroy
  room = Room.find(params[:id])
  room.destroy
  redirect_to root_path
end