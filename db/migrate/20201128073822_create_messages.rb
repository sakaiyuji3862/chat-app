class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :content
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
# references。railsで外部キーのカラムを追加する際に、用いる型。
# foreign_key: true。usersテーブルとroomsテーブルの情報を参照できる。