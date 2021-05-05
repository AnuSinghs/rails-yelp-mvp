class Review < ApplicationRecord
  belongs_to :restaurant

  validates :content, presence: true
  validates :rating, presence: true
  validates :rating, numericality: true, inclusion: { in: 0..5 }
end
