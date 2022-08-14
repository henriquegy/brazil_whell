class Adress < ApplicationRecord
    has_many :deliver_has_adresses
    has_many :delivers, through: :deliver_has_adresses
end
