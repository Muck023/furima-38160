class Item < ApplicationRecord
  validates :product,         presence: true
  validates :message,         presence: true
  validates :category_id,     presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id,       presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :defrayment_id,   presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :region_id,       presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :reach_id,        presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price,           presence: true, format: { with: /\A(?=.*?[3-9])\d{3,7}\z/ }

  belongs_to :user
  has_one_attached :image
  validates :image,           presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :defrayment
  belongs_to :region
  belongs_to :reach
end
