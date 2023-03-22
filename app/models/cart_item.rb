class CartItem < ApplicationRecord
    belongs_to :item
    belongs_to :customer
    validates :amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

end
