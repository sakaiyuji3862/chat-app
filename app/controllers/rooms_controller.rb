class RoomsController < ApplicationController
  def index
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def room_params # ストロングパラメーター
    # user_ids: []。このように、配列に対して保存を許可したい場合はキーに対し [] を値として記述
    params.require(:room).permit(:name, user_ids: [])
  end
end
