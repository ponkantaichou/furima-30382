class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to_active_hash :category
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :shipping
  belongs_to_active_hash :status

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :status_id, presence: true
  validates :shipping_id, presence: true
  validates :shipment_source_id, presence: true
  validates :shipping_day_id, presence: true
  validates :category_id, presence: true
  validates :image, presence: true

  validates :category_id, numericality: { other_than: 1 }
  validates :shipment_source_id, numericality: { other_than: 1 }
  validates :shipping_day_id, numericality: { other_than: 1 }
  validates :shipping_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }

  validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9999999 }
end
