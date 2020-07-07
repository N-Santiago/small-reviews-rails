class Review < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :comments
    has_many :users, through: :comments
    validates :title, presence: true, length: { in: 3..30 }
    validates :content, presence: true, length: { maximum: 250 } 
end
