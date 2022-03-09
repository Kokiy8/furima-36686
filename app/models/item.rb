class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :days_to
  belongs_to :prefecture
  belongs_to :user

  has_one :record
  has_one_attached :image

  validates :item_name, :description, :category_id, :condition_id, :delivery_charge_id, :days_to_id, :prefecture_id, :price,
            :image, presence: true
  validates :category_id, :condition_id, :delivery_charge_id, :days_to_id, :prefecture_id, numericality: { other_than: 1 }
  validates :price, format: { with: /\A[0-9]+\z/ }
  validates :price,
            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                            message: 'は一覧にありません' }
end
