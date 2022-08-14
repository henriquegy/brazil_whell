class CreateDeliverHasProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :deliver_has_products do |t|
      t.belongs_to :deliver
      t.belongs_to :product
      t.datetime   :deleted_at

      t.timestamps
    end
  end
end
