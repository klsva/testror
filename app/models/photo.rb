class Photo < ApplicationRecord
  belongs_to :album
  mount_uploader :file, PhotoUploader
  has_many :values
  has_many :comments
  validate :file_size

  private
    #проверка размера изображения
    def file_size
      if file.size > 5.megabytes
        errors.add(:file, 'должен быть меньше 5Мб')
      end
    end
end
