class CreateDeliverHasAdresses < ActiveRecord::Migration[5.2]
  def change
    create_table :deliver_has_adresses do |t|
      t.belongs_to :deliver
      t.belongs_to :adress
      t.string     :type
      t.datetime   :deleted_at

      t.timestamps
    end
  end
end
