class Deliver < ApplicationRecord
    has_one :truck
    has_one :employee

    has_many :deliver_has_products
    has_many :products, through: :deliver_has_products

    has_many :deliver_has_adresses
    has_many :adresses, through: :deliver_has_adresses

    accepts_nested_attributes_for  :deliver_has_products,
                                   reject_if: :all_blank,
                                   allow_destroy: true

    accepts_nested_attributes_for  :deliver_has_adresses,
                                   reject_if: :all_blank,
                                   allow_destroy: true

    scope :delivery_date_between, lambda {|start_date, end_date| where("delivery_date >= ? AND delivery_date <= ?", start_date, end_date )}
end
