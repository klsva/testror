class Comment < ApplicationRecord
  belongs_to :photo
  belongs_to :user
  default_scope -> { order(created_at: :asc)} #задает порядок показа альбомов
  validates :user_id, presence: true #проверка user_id в comment
  validates :photo_id, presence: true #проверка user_id в photo
  validates :content, presence: true, length: {maximum: 150}
end
