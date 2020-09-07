class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  
  validates :content, presence: true
  has_one_attached :image #Messagesテーブルの各レコードと画像ファイルを管理するimageカラム?の紐付けに成功?
  validates :content, presence: true, unless: :was_attached? #unlessオプション 特定の条件(下で定義したwas_attachedメソッド)でバリデーションを行わない

  def was_attached?
    self.image.attached?       #クラスメソッド？ def self.メソッド名でないの？
  end
end
