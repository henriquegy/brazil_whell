class DeliverHasProduct < ApplicationRecord
    belongs_to :deliver
    belongs_to :product

    accepts_nested_attributes_for :product
end
