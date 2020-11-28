class Room < ApplicationRecord
  has_many :room_users
  # 中間テーブルを通して繋がっているものにはthrough:というkeyをつける。
  has_many :users, through: room_users
end
