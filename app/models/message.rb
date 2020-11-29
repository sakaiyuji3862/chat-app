class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  # 各レコードとファイルを1対1の関係で紐づけるメソッドです。has_one_attachedメソッドを記述したモデルの各レコードは、
  # それぞれ1つのファイルを添付できます。has_one_attached :ファイル名
  has_one_attached :image
  # was_attached?メソッドがfalseならばバリデーションによる検証を行う」という条件。
  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    # 画像があればtrue、なければfalseを返す仕組み。これにより、画像が存在しなければテキストが必要となり、画像があればテキストは不要になる。
    self.image.attached?
  end
end
