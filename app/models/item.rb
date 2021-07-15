class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :days_to_ship_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999999, only_integer: true }
  end
end
