class Product < ApplicationRecord
    has_many :deliver_has_products
    has_many :delivers, through: :deliver_has_products
end
