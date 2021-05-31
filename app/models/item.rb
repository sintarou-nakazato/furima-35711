class Item < ApplicationRecord
  with_options presence: true do
    validates :product_name
    validates :product_description
    validates :category_id,            numericality: { other_than: 1 }
    validates :condition_id,           numericality: { other_than: 1 }
    validates :cost_id,                numericality: { other_than: 1 }
    validates :area_id,                numericality: { other_than: 1 }
    validates :day_id,                 numericality: { other_than: 1 }
    validates :price
    validates :image
  end


  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash  :category
  belongs_to_active_hash :Condition
  belongs_to_active_hash :cost
  belongs_to_active_hash :area
end
