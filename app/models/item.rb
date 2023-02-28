class Item < ApplicationRecord
    has_one_attached :image
    belongs_to :cart_items
end
