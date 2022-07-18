class Photo < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :filename, presence: true
end
