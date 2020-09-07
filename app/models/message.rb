class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image #Messagesテーブルの各レコードと画像ファイルを管理するimageカラム?の紐付けに成功?

  validates :content, presence: true
end
