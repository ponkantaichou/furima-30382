class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :shipping
  belongs_to_active_hash :status

  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :status_id
    validates :shipping_id
    validates :shipment_source_id
    validates :shipping_day_id
    validates :category_id
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :shipment_source_id
    validates :shipping_day_id
    validates :shipping_id
    validates :status_id
  end

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
