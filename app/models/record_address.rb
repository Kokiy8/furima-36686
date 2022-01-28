class RecordAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_number, :user_id, :item_id

  with_options presence: true do
  validates :prefecture_id
  validates :municipalities
  validates :address
  validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :telephone_number, format: { with: /\A\d{10,11}\z/ }
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    record = Record.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building_name: building_name, telephone_number: telephone_number, record_id: record.id)
  end
end
