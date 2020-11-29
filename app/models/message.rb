class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  # 各レコードとファイルを1対1の関係で紐づけるメソッドです。has_one_attachedメソッドを記述したモデルの各レコードは、
  # それぞれ1つのファイルを添付できます。has_one_attached :ファイル名
  has_one_attached :image
  validates :content, presence: true
end
