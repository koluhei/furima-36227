class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true }
    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id
      validates :status_id
      validates :delivery_charge_id
      validates :prefecture_id
      validates :days_to_ship_id
    end
  end

  has_one_attached :image
  belongs_to :user
    
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :days_to_ship
end
