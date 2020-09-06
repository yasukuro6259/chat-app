class CreateRoomUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :room_users do |t|
      t.timestamps
      t.references :room, foreign_key: true  #t.references :モデル名, foreign_key:true
      t.references :user, foreign_key: true  #references型 外部キーのカラムを追加する際に用いられる
    end
  end
end
