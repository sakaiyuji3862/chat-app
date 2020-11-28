class MessagesController < ApplicationController
  def index
    # 生成した、Messageモデルのインスタンス情報を代入。
    @message = Message.new 
    # Room.find(params[:room_id])と記述することで、paramsに含まれているroom_idを代入。ルーティングをネストしている為、
    # /rooms/:room_id/messagesといったパスになり、room_idが含まれるため、paramsというハッシュオブジェクトの中に、room_id
    # という値が存在しています。そのため、params[:room_id]と記述することでroom_idを取得できます。
    @room = Room.find(params[:room_id])
  end

  # def new
  #   @message = Message.new
  # end

  def create
    @room = Room.find(params[:room_id])
    # @room.messages.newでチャットルームに紐づいたメッセージのインスタンスを生成し、message_paramsを引数にして、privateメソッドを呼び出す。
    @message = @room.messages.new(message_params)
    # saveメソッドでメッセージの内容をmessagesテーブルに保存。
    if @message.save
      redirect_to room_messages_path(@room)
    else
      render :index
    end
  end
  
  # privateメソッドとしてmessage_paramsを定義
  private
  def message_params
    # メッセージの内容(content)をmessagesテーブルへ保存できるようにします。パラメーターの中に、ログインしているユーザーのidと紐付いている、
    # メッセージの内容(content)を受け取れるように許可します。
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
