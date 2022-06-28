class Item < ApplicationRecord
  validates :product,         presence: true
  validates :message,         presence: true
  validates :category_id,     presence: true
  validates :status_id,       presence: true
  validates :defrayment_id,   presence: true
  validates :region_id,       presence: true
  validates :reach_id,        presence: true
  validates :price,           presence: true, format: { with: /\A(?=.*?[3-9])\d{3,7}\z/ }

  belongs_to :user
end
