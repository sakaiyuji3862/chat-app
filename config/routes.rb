Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :users, only: [:edit, :update]
  # メッセージを投稿する際には、どのルームで投稿されたメッセージなのかをパスから判断できるようにしたい。ルーティングのネストを使用。
  # roomsが親で、messagesが子という親子関係になるので、チャットルームに属しているメッセージという意味になる。
  resources :rooms, only: [:new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end
end
