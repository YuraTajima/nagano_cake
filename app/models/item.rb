class Item < ApplicationRecord
    has_one_attached :image
    has_many :cart_items
    has_many :order_details
    belongs_to :genre
    
    validates :introduction, presence: true
    validates :name, presence: true
    validates :price, presence: true, numericality: { only_integer: true }
    validates :is_active, inclusion: {in: [true, false]}
end
