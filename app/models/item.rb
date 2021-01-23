class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :state
  belongs_to :shipping_day

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :state_id
    validates :shipping_day_id
  end
  
  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'Out of setting range' }
end