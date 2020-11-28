class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # バリデーション。名前が空だったらデータベースに保存しない。
  validates :name, presence: true   

  has_many :room_users
  # 中間テーブルを通して繋がっているものにはthrough:というkeyをつける。
  has_many :rooms, through: :room_users
  has_many :messages
end
