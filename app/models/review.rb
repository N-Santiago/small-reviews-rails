require 'pry'
class Review < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :comments, dependent: :destroy 
    # dependent: :destroy means the comments related 
    # to the specific review in mention get deleted if the post does.
    has_many :users, through: :comments
    validates :title, presence: true, length: { in: 3..35 }
    validates :content, presence: true, length: { maximum: 250 }
    default_scope {order(created_at: :desc)}
    #by default, the reviews will be displayed from newest to oldest.
end
