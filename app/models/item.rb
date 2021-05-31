class Item < ApplicationRecord
  with_options presence: true do
    validates :product_name
    validates :product_description
    validates :category_id
    validates :condition_id
    validates :cost_id
    validates :area_id
    validates :day_id
    validates :price
    validates :image
  end

  belongs_to :user
  has_one_attached :image
end
