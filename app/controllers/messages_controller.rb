class MessagesController < ApplicationController
  def index
    # 空のインスタンスを生成。保存用。
    @message = Message.new 
    # Room.find(params[:room_id])と記述することで、paramsに含まれているroom_idを代入。ルーティングをネストしている為、
    # /rooms/:room_id/messagesといったパスになり、room_idが含まれるため、paramsというハッシュオブジェクトの中に、room_id
    # という値が存在しています。そのため、params[:room_id]と記述することでroom_idを取得できます。
    @room = Room.find(params[:room_id]) #これを定義しないとルームに入れない。
    # チャットルームに紐付いている全てのメッセージ（@room.messages）を@messagesと定義。一覧画面で表示するメッセージ情報には、ユーザー情報も紐付いて表示されます。
    # 全てのメッセージ情報に紐づくユーザー情報を、includes(:user)と記述をすることにより、ユーザー情報を1度のアクセスでまとめて取得することができる。N + 1問題解消。
    @messages = @room.messages.includes(:user)
  end

  # def new
  #   @message = Message.new
  # end

  def create
    @room = Room.find(params[:room_id]) # どこのルームに保存するか 
    # @room.messages.newでチャットルームに紐づいたメッセージのインスタンスを生成し、message_paramsを引数にして、privateメソッドを呼び出す。
    @message = @room.messages.new(message_params)
    # saveメソッドでメッセージの内容をmessagesテーブルに保存。
    if @message.save
      redirect_to room_messages_path(@room)
    else
      # 投稿に失敗した@messageの情報を保持しつつindex.html.erbを参照することができる。
      @messages = @room.messages.includes(:user)
      render :index
    end
  end
  
  # privateメソッドとしてmessage_paramsを定義
  private
  def message_params
    # メッセージの内容(content)をmessagesテーブルへ保存できるようにします。パラメーターの中に、ログインしているユーザーのidと紐付いている、
    # メッセージの内容(content)を受け取れるように許可します。
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
