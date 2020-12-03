class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  # 中間テーブルを通して繋がっているものにはthrough:というkeyをつける。
  has_many :users, through: :room_users
  # dependentオプション。親モデルを削除した時に、親モデルと関連している子モデルに対する挙動を指定するオプションです。
  # dependentオプションに:destroyを指定したときは、親モデルが削除されたとき、それに紐付ている子モデルも一緒に削除されます。
  has_many :messages, dependent: :destroy

  validates :name, presence: true 
end
# dependentオプションに:destroyを指定した場合、Room（親モデル）が削除されたときに、Message（子モデル）とUser（子モデル）が通るRoomUser（中間テーブルのモデル）
# も削除されます。これで、roomを削除したとき、roomに関連するmessagesテーブルのレコードとroom_usersテーブルのレコードも、一緒に削除されるように設定できました。

