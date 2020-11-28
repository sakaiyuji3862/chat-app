class CreateRoomUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :room_users do |t|
      # references。railsで外部キーのカラムを追加する際に、用いる型。
      # foreign_key: true。usersテーブルとroomsテーブルの情報を参照できる。
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
