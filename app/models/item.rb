class Item < ApplicationRecord

  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :status_id, presence: true
  validates :shipping_id, presence: true
  validates :shipment_source_id, presence: true
  validates :shipping_day_id, presence: true
  validates :category_id, presence: true
  
end
