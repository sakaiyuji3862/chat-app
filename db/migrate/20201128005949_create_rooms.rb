class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name,   null: false # null: false。指定したカラムに空の状態で保存させるのを防ぎます。
      t.timestamps
    end
  end
end
