class DeliverHasAdress < ApplicationRecord
    belongs_to :deliver
    belongs_to :adress

    accepts_nested_attributes_for :adress
end
