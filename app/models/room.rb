class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users, dependent: :destroy #ルームを削除するとき、紐づいているuser情報(中間テーブルのみ)も一緒に削除する
  has_many :messages, dependent: :destroy #ルームを削除するとき、紐づいているmessage情報(中間テーブルのみ)も一緒に削除する

  validates :name, presence: true
  
end