class RoomsController < ApplicationController
  def index
  end

  def new
    # 空のインスタンスを生成、保存用
    @room = Room.new
  end

  def create
    @room = Room.new(room_params) # newをcreateにしても同じ意味。ifで式展開したいからnew。
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    # どのチャットルームを削除するのか特定するために記述。削除したいチャットルームの情報を記述。
    room = Room.find(params[:id])
    # 削除するだけなのでビューの表示は必要ない。その為、変数としてroomを定義し、destroyメソッドを使用。
    room.destroy 
    redirect_to root_path
  end

  private

  def room_params # ストロングパラメーター
    # user_ids: []。このように、配列に対して保存を許可したい場合はキーに対し [] を値として記述
    params.require(:room).permit(:name, user_ids: [])
  end
end
