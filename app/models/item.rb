class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :days_to
  belongs_to :prefectures

  has_one_attached :image

  validates :item_name, :description, presence: true
  validates :category_id, :condition_id, :delivery_charge_id, :days_to_id, :prefectures_id, numericality: {other_than: 1 }
end
